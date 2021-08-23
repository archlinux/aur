# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=bs1770gain
pkgver=0.6.0
pkgrel=4
pkgdesc="A loudness scanner compliant with ITU-R BS.1770."
arch=(x86_64)
url="http://bs1770gain.sourceforge.net"
license=(GPL)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz" remove-inappropriate-text.patch)
sha256sums=('d0372bb5946a34c7cad145e2d406b4e99751df229694acad10f1f4c1778fd85a'
            '71cd58f8c3546485decd135992039bf9df266f5c2c0c478c32771ab5e0f0b314')

prepare() {
    cd ${pkgname}-${pkgver}
    patch -Np1 -i "${srcdir}"/remove-inappropriate-text.patch
}

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
