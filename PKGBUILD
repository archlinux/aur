# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python38-traitlets
pkgver=5.5.0
pkgrel=1
pkgdesc="A configuration system for Python applications"
arch=('any')
url="https://traitlets.readthedocs.io/en/stable/"
license=('BSD')
depends=('python38-decorator')
makedepends=('python38-build' 'python38-installer' 'python38-hatchling')
checkdepends=('python38-pytest')
source=("https://files.pythonhosted.org/packages/source/t/traitlets/traitlets-$pkgver.tar.gz")
sha256sums=('b122f9ff2f2f6c1709dab289a05555be011c87828e911c0cf4074b85cb780a79')

build() {
  cd traitlets-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd traitlets-$pkgver
  pytest -v
}

package() {
  cd traitlets-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
