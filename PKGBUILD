# Contributor: taotieren <admin@taotieren.com>

pkgname=fantascene-dynamic-wallpaper
pkgver=1.5.5
pkgrel=1
pkgdesc="dynamic wallpaper. A very nice animated wallpaper on X11 systems.Support Movie and Web animated wallpaper."
arch=('any')
url="https://github.com/dependon/fantascene-dynamic-wallpaper"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
depends=(mpv
    qt5-x11extras
    qt5-webengine)
makedepends=(pkgconfig
    qt5-tools
    make)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz" )
sha256sums=('d82a41dc4ff2ae3618abe384a9615192626b6c26ee9b5c060e93ce2edee7f663')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake ./${pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make INSTALL_ROOT="$pkgdir"  -C ./build install
}
