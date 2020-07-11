# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-annotations
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=2.2.1
pkgrel=1
pkgdesc="A flake8 extension that checks type annotations"
arch=('any')
url="https://github.com/python-discord/flake8-annotations"
license=('MIT')
depends=('python' 'flake8' 'python-typed-ast')
makedepends=('python-setuptools' 'python-dephell')
checkdepends=() # TODO
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('edd39ca9ae6d701e8b70762bfe3b44129cbbf04a97813d91d41065dd591cc89277121307419bcbc6c2ef54455632fa0d1c28999859fd0ca6794102de35d4b0e6')

prepare() {
  cd "$_pkgname-$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
