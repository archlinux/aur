# Contributor: taotieren <admin@taotieren.com>

pkgname=fantascene-dynamic-wallpaper
pkgver=1.5.0
pkgrel=1
pkgdesc="dynamic wallpaper. A very nice animated wallpaper on X11 systems.Support Movie and Web animated wallpaper."
arch=('any')
url="https://github.com/dependon/fantascene-dynamic-wallpaper"
license=('GPLv3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
depends=(mpv
         qt5-tools
         qt5-x11extras
         qt5-webengine)
makedepends=(qconf
            pkgconfig
            make)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz" )
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake ./${pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make INSTALL_ROOT="$pkgdir"  -C ./build install
}
