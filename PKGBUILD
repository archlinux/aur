# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-fasteners-git
pkgver=0.17.3.r8.g5d8de5f
pkgrel=1
pkgdesc="A python package that provides useful locks."
provides=('python-fasteners')
conflicts=('python-fasteners')
arch=(any)
url="https://github.com/harlowja/fasteners"
license=(Apache)
depends=("python")
makedepends=("git" "python-setuptools" "python-build" "python-installer" "python-wheel")
source=("fasteners::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/fasteners"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/fasteners"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/fasteners"
  python -m installer --destdir $pkgdir dist/*.whl
}
