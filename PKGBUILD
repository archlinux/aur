# Contributor: Michal Wojdyla <micwoj9292 at gmail dot com>

pkgname=kdevelop-python-git
pkgver=5.6.1.r31.g95dc8683
pkgrel=1
pkgdesc="Python language and documentation plugin for KDevelop, git version"
arch=(x86_64)
url="http://www.kdevelop.org/"
license=(GPL)
depends=(kdevelop python)
makedepends=(extra-cmake-modules git)
optdepends=('python-pycodestyle: for Python style checking')
provides=('kdevelop-python')
conflicts=('kdevelop-python')
source=("git+https://invent.kde.org/kdevelop/kdev-python.git")
sha256sums=('SKIP')

pkgver() {
  cd kdev-python
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S kdev-python \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
