# Maintainer: Avi Tretiak <avi at babi dot uy>
# Build from upstream git source.

pkgname=kwin-effects-glass-git
pkgver=r564.a2f8a79
pkgrel=1
pkgdesc="Fork of Plasma 6 blur effect with force blur, rounded corners, refraction (Wayland 6.6+)"
arch=(x86_64)
url="https://github.com/4v3ngR/kwin-effects-glass"
license=(GPL-3.0-or-later)
depends=(kio knotifications kcrash kglobalaccel kcmutils libepoxy kwin)
conflicts=()
provides=("${pkgname%-git}")
makedepends=(git cmake extra-cmake-modules qt6-tools kwin vulkan-headers)

# Build from upstream git source.
source=("${pkgname}::git+https://github.com/4v3ngR/kwin-effects-glass.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  local _build="${srcdir}/build"
  cmake -B "$_build" -S "${srcdir}/${pkgname}" \
    -W no-dev \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr
  cmake --build "$_build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
}
