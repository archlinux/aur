# Maintainer: Santiago Lo Coco <santilococo.01@gmail.com>

pkgname=libxft-bgra
pkgver=2.3.4
pkgrel=1
pkgdesc="X FreeType library with support for BGRA glyphs and scaling."
arch=('x86_64')
url="https://xorg.freedesktop.org"
license=('custom')
provides=('libxft')
conflicts=('libxft')
depends=('fontconfig' 'libxrender')
makedepends=('pkgconf')
source=("${url}/releases/individual/lib/libXft-${pkgver}.tar.bz2"
        "bgra_patch::https://gitlab.freedesktop.org/xorg/lib/libxft/merge_requests/1.patch")
sha256sums=('57dedaab20914002146bdae0cb0c769ba3f75214c4c91bd2613d6ef79fc9abdd' 
            '0e313ab2eccd7d2f68fc2d409493dd972de9cbe70510c4eb707ad16f8ed6f03e')

build() {
    cd "${srcdir}/libXft-${pkgver}"
    patch -p1 < "${srcdir}/bgra_patch"
    sh configure --prefix=/usr --sysconfdir=/etc --disable-static
    make
}

package() {
    cd "${srcdir}/libXft-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
