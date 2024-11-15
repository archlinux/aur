# Contributor: taotieren <admin@taotieren.com>

pkgname=fantascene-dynamic-wallpaper
pkgver=1.9.3
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
sha256sums=('d0721c19cd95a9c2a9a8a8ea3be74c77efc0f5a67f0e67665a11cd013ac3889a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake ./${pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make INSTALL_ROOT="$pkgdir"  -C ./build install
}
