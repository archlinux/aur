# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=font-bh-ttf
pkgver=1.0.3
pkgrel=9
pkgdesc='X.org Luxi Truetype fonts'
url='https://xorg.freedesktop.org/releases/individual/font/'
license=('custom')
arch=('any')
source=("${url}${pkgname}-${pkgver}.tar.bz2")
sha256sums=('1b4bea63271b4db0726b5b52c97994c3313b6023510349226908090501abd25f')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
    --with-fontdir=/usr/share/fonts/TTF \
    --with-fc-confdir=/usr/share/fontconfig \
    MKFONTSCALE=/bin/true MKFONTDIR=/bin/true
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install \
    actualconfigdir=/usr/share/fontconfig/conf.default
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}

