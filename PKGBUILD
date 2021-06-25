# Maintainer: acedron <acedrons@yahoo.co.jp>
pkgname=egawari
pkgver=0.1.2
pkgrel=1
pkgdesc="Makes your touchpad work like a graphics tablet."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/acedron/egawari"
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
sha256sums=('56639fbd4e34649c63cd15886a1b3f340bff921a7612404761285012a9968408')

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

