# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="gr-framework"
pkgver="0.71.7"
pkgrel="1"
pkgdesc="A universal framework for cross-platform visualization applications."
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
url="https://gr-framework.org"
license=("MIT")
depends=("bzip2" "cairo" "fontconfig" "freetype2" "ghostscript" "glfw-x11" \
         "libjpeg-turbo" "libpng" "libtiff" "libx11" "libxft" "libxt" "pixman" \
         "qhull" "qt5-base" "zlib")
makedepends=("cmake")
optdepends=("ffmpeg: video support")
source=("https://github.com/sciapp/gr/archive/v${pkgver}.tar.gz")
sha256sums=("781bd832e55939daa7362f86476b67eaa4158beacfdeadb8c4d41be0dab10c54")

prepare() {
    cd "${srcdir}/gr-${pkgver}" || return
    echo "${pkgver}" > version.txt
}

build() {
    cd "${srcdir}/gr-${pkgver}" || return
    cmake -DCMAKE_INSTALL_PREFIX=/usr/gr \
          -DCMAKE_BUILD_TYPE=Release \
          -DGR_USE_BUNDLED_LIBRARIES=OFF \
          -S . \
          -B build && \
    cmake --build build
}

package() {
    cd "${srcdir}/gr-${pkgver}" || return
    DESTDIR="${pkgdir}" cmake --install build
}
