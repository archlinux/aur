# Maintainer: acedron <acedrons@yahoo.co.jp>
pkgname=abstouch-nux
pkgver=1.0.0
pkgrel=1
pkgdesc="Makes your touchpad work like a graphics tablet on GNU/Linux."
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
sha256sums=('0722f777d735b816889a29e79e300aabbc31986f191f1e3e081c7a38464c7dbc')

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
