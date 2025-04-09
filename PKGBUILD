# Contributor: taotieren <admin@taotieren.com>

pkgname=fantascene-dynamic-wallpaper-git
srcname=fantascene-dynamic-wallpaper-git
pkgver=2.0.1.r2.g8c5ae3b
pkgrel=1
pkgdesc=" dynamic wallpaper. A very nice animated wallpaper on X11 systems.Support Movie and Web animated wallpaper."
arch=($CARCH)
url="https://github.com/dependon/fantascene-dynamic-wallpaper"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
depends=(
    gcc-libs
    glib2
    glibc
    libx11
    libxcb
    libxext
    xcb-util-wm
    mpv
    qt5-charts
    qt5-base
    qt5-multimedia
    qt5-webengine
)
makedepends=(
    git
    qt5-tools
    pkgconfig
    make
)
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${pkgname%-git}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    qmake ./${pkgname%-git}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make INSTALL_ROOT="${pkgdir}" -C ./build install
}
