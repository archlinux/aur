# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=plasmavideowallpaper-git
_gitname=PlasmaVideoWallpaper
pkgver=1.1
pkgrel=2
epoch=
pkgdesc="A KDE Plasma 5 wallpaper plugin which can let you using a video as the wallpaper"
arch=(x86_64)
url="https://github.com/WuSiYu/PlasmaVideoWallpaper"
license=('GPL')
groups=()
depends=('gst-libav' 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'plasma-desktop' 'mpv')
makedepends=('git' 'cmake' 'extra-cmake-modules')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+${url}.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
    cmake \
        -B "${_gitname}/build" \
        -S "${_gitname}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCODE_COVERAGE:BOOL='OFF' \
        -Wno-dev
    make -C "${_gitname}/build" all
}

package() {
    make -C "${_gitname}/build" DESTDIR="$pkgdir" install
}

