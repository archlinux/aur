# Maintainer: acedron <acedrons@yahoo.co.jp>
pkgname=abstouch-nux
pkgver=1.0.0
pkgrel=1
pkgdesc="An absolute touchpad input client for GNU/Linux."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/acedron/abstouch-nux"
license=('GPL3')
depends=(
    'libxi'
    'libx11'
    'xf86-input-libinput'
)
makedepends=(
    'cmake>=3.9.0'
    'gcc'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/acedron/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0d4534293ba44b07de68875a071882f5229533e59b568d7ce6b37eba6d173f96')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake \
        -B build \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    make -C build all
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -C build test
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -C build DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
