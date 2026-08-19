# Maintainer:  Radu Potop <radu at wooptoo dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Maarten Baert

pkgname=simplescreenrecorder
pkgver=0.4.4.79.ge73e
# Pin commit until the next upstream release
_commit=e73e07664121ac30836872bca76194c6570e04c8
pkgrel=4
pkgdesc="A feature-rich screen recorder that supports X11 and OpenGL."
arch=("x86_64")
url="https://www.maartenbaert.be/simplescreenrecorder/"
license=("GPL-3.0-only")
depends=(
    "alsa-lib"
    "desktop-file-utils"
    "ffmpeg"
    "glu"
    "gtk-update-icon-cache"
    "jack"
    "libglvnd"
    "libpipewire"
    "libpulse"
    "libvorbis"
    "libx11"
    "libxext"
    "libxfixes"
    "libxi"
    "libxinerama"
    "libxkbcommon"
    "qt6-base"
)
optdepends=("lib32-simplescreenrecorder: OpenGL recording of 32-bit applications")
makedepends=("git" "cmake" "qt6-tools")
source=("git+https://github.com/MaartenBaert/ssr.git#commit=$_commit")
sha256sums=('e514e25394a8de049786b9bed411e0ea1f234d1cfb5da2bb9d52c86bc59aa910')

install=simplescreenrecorder.install

pkgver() {
    cd ssr
    git describe --abbrev=4 --always --tags | sed 's/-/./g'
}

build() {
    cd ssr
    cmake -S . -B build \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_QT6=TRUE \
        -DWITH_QT5=FALSE

    cmake --build build
}

package() {
    cd ssr/build
    make DESTDIR="$pkgdir" install
}
