# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=remarshal
pkgver=0.6.0
pkgrel=1
pkgdesc="Convert between TOML, YAML and JSON"
arch=('any')
depends=('python' 'python-dateutil' 'python-pytoml' 'python-yaml')
makedepends=('python-setuptools')
url="https://github.com/dbohdan/remarshal"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/dbohdan/$pkgname/tar.gz/v$pkgver)
sha256sums=('19e85b010ada81f3094ce4e607d6f26aeb2ea40c92c4c704fe1cdb8fd8f637ee')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
