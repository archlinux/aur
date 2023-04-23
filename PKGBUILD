# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=font-bh-ttf
pkgver=1.0.4
pkgrel=1
pkgdesc='X.org Luxi Truetype fonts'
url='https://xorg.freedesktop.org/releases/individual/font/'
license=('custom')
arch=('any')
source=("${url}${pkgname}-${pkgver}.tar.gz")
sha256sums=('bf662d20107d60a964ade831b8ad575a58510e0f2fb9f67e8f064bbbeaae45b4')

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

