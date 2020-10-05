# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=cruft
pkgver=2.5.0
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
sha1sums=('eba7403d842c201527638d13e3031cede726491f')
sha256sums=('dcfaaeaed45c60f29e410ce07f710f5b46296f2232e6637b3d6b10ac42f61418')

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
