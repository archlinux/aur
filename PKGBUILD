# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=cruft
pkgver=2.8.0
pkgrel=1
pkgdesc='Maintain all the necessary boilerplate for packaging and building projects separate from the code you intentionally write. Fully compatible with existing Cookiecutter templates'
arch=('any')
url='https://cruft.github.io/cruft/'
license=('MIT')
depends=('python'
         'python-click'
         'python-cookiecutter'
         'python-gitpython'
         'python-typer')
optdepends=('python-toml: specify patterns to ignore in toml files')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('bd940e2da3c6f4471a8ec841dba715616b2fb20d')
sha256sums=('29e6c95ed46bda8d26b9666e78bdcd625f3a2352620fc52c44dc4ff64a298ce0')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 noet:
