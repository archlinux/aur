# Contributor: taotieren <admin@taotieren.com>

pkgname=fantascene-dynamic-wallpaper
pkgver=2.1.6
pkgrel=1
pkgdesc="dynamic wallpaper. A very nice animated wallpaper on X11 systems.Support Movie and Web animated wallpaper."
arch=($CARCH)
url="https://github.com/dependon/fantascene-dynamic-wallpaper"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
_qt=qt6
depends=(
    glib2
    libgcc_s.so
    libstdc++.so
    libglvnd
    libx11
    libxcb
    libxext
    xcb-util-wm
    mpv
    ${_qt}-charts
    ${_qt}-base
    ${_qt}-multimedia
)
makedepends=(
    git
    ${_qt}-tools
    ${_qt}-webengine
    pkgconfig
    make
)
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('3fd78e82aa951985b0fd7d4299ee3500d1af24fbcd21a4576d972429f60962ca')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    export CXXFLAGS="${CXXFLAGS} -fpermissive"
    qmake6 ./${pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    cd "${srcdir}/${pkgname}"
    make INSTALL_ROOT="$pkgdir" -C ./build install
}
