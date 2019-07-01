# Maintaienr:Bernie Innocenti <bernie@codewiz.org>

pkgname=plasma-thunderbolt-git
_pkgname=plasma-thunderbolt
pkgver=82.ce67155
pkgrel=1
pkgdesc='Plasma addons for managing Thunderbolt devices'
arch=(x86_64)
url="https://cgit.kde.org/${_pkgname}.git"
license=(GPL)
depends=(bolt kservice)
makedepends=(git extra-cmake-modules plasma-framework)
groups=(plasma)
source=("git+https://anongit.kde.org/${_pkgname}.git")
sha256sums=('SKIP')
validpgpkeys=('DD0AC837C3FAA57615747A2FC451030771FF4BAC') # Bernie Innocenti <bernie@codewiz.org>

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${_pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
