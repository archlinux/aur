# Contributor: taotieren <admin@taotieren.com>

pkgname=fantascene-dynamic-wallpaper
pkgver=1.8.4
pkgrel=1
pkgdesc="dynamic wallpaper. A very nice animated wallpaper on X11 systems.Support Movie and Web animated wallpaper."
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/dependon/fantascene-dynamic-wallpaper"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
depends=(mpv
    qt5-x11extras
    qt5-webengine)
makedepends=(pkgconfig
    qt5-tools
    make)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz" )
sha256sums=('bf67c8820ec869f123c73d6268d8bf5d412ba0de9d8d5a7700a34670139174f3')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake ./${pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make INSTALL_ROOT="$pkgdir"  -C ./build install
}
