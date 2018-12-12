# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=libva-utils-headless
_pkgname=libva-utils
pkgver=2.3.0
pkgrel=1
pkgdesc="Intel VA-API Media Applications and Scripts for headless libva"
arch=('x86_64')
url="https://github.com/01org/libva-utils"
license=('custom')
depends=('libva-headless')
conflicts=('libva-utils')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('f338497b867bbc9bf008e4892eaebda08955785dc7eb2005855bba5f1a20b037')

build() {
    cd ${_pkgname}-${pkgver}
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-drm \
        --disable-x11 \
        --disable-wayland
    make
}

package() {
    cd ${_pkgname}-${pkgver}
    make DESTDIR="$pkgdir" install
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/${_pkgname}/COPYING
}
