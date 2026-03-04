# Contributor: taotieren <admin@taotieren.com>

pkgname=fantascene-dynamic-wallpaper-git
srcname=fantascene-dynamic-wallpaper-git
pkgver=2.1.0.r1.gb768a34
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
    qt6-charts
    qt6-base
    qt6-multimedia
    qt6-webengine
    base-devel
)
makedepends=(
    git
    qt6-tools
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
    qmake6 ./${pkgname%-git}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make INSTALL_ROOT="${pkgdir}" -C ./build install
}
