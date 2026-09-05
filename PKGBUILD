pkgname=darkly-plasma-theme-git
_pkgname=Darkly
pkgver=r2833
pkgrel=1
pkgdesc="Modern Qt/KDE application style and window decoration"
arch=('x86_64')
url="https://github.com/Bali10050/Darkly"
license=('GPL-2.0-or-later')

depends=(
  'plasma-workspace'
)

makedepends=(
  'git'
  'cmake'
  'extra-cmake-modules'
  'gcc'
  'make'
)

provides=('darkly')
conflicts=('darkly')

source=("${_pkgname}::git+https://github.com/Bali10050/Darkly.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cmake \
    -B build \
    -S "${srcdir}/${_pkgname}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
