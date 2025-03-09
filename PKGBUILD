# Contributor: taotieren <admin@taotieren.com>

pkgname=fantascene-dynamic-wallpaper
pkgver=1.9.9
pkgrel=2
pkgdesc="dynamic wallpaper. A very nice animated wallpaper on X11 systems.Support Movie and Web animated wallpaper."
arch=($CARCH)
url="https://github.com/dependon/fantascene-dynamic-wallpaper"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
depends=(
    mpv
    qt5-base
    qt5-multimedia
    qt5-x11extras
    qt5-webengine)
makedepends=(
    pkgconfig
    qt5-tools
    make)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('dabb11732e13a5868880acdbee42abb4acc2259e4881fb5385e766e233c2d6b6')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake ./${pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make INSTALL_ROOT="$pkgdir" -C ./build install
}
