# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

pkgname=libxft-bgra
pkgver=2.3.5
pkgrel=1
pkgdesc="X FreeType library with support for BGRA glyphs and scaling."
arch=('x86_64')
url="https://xorg.freedesktop.org"
license=('custom')
depends=('fontconfig' 'libxrender')
makedepends=('pkgconf')
provides=('libxft')
conflicts=('libxft')
source=("${url}/releases/individual/lib/libXft-${pkgver}.tar.gz")
sha256sums=('f7324aa0664115223672bae55086f3a9ae8f6ad4cdca87a8dd620295ee459e1a')

build() {
    cd "${srcdir}/libXft-${pkgver}"
    sh configure --prefix=/usr --sysconfdir=/etc --disable-static
    make
}

package() {
    cd "${srcdir}/libXft-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
