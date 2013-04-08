# Maintainer: Ivan Puntiy <ivan.puntiy at gmail>
# Contributor: <francois.archlinux.org>

pkgname=culmus
pkgver=0.130
pkgrel=1
pkgdesc="A collection of Type1 and TrueType Hebrew fonts"
arch=('any')
url="http://culmus.sourceforge.net"
license=('GPL2')
depends=('fontconfig' 'xorg-fonts-alias' 'xorg-font-utils' 'xorg-fonts-encodings')
install=${pkgname}.install
source=(
  "http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  "$pkgname-0.121-fontconfig_fix.patch"
)
md5sums=('58e672defde4caeae42017cd2f9436a6'
         '6db715a072d9602a54c69a7e31a6428f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # fix due to fontconfig 2.10.1 update - patch mailed to upstream
  patch culmus.conf "$srcdir/$pkgname-0.121-fontconfig_fix.patch"
}

package() {
  # install Type1 fonts
  install -d ${pkgdir}/usr/share/fonts/Type1
  install -m644 ${srcdir}/culmus-$pkgver/*.{afm,pfa} \
    ${pkgdir}/usr/share/fonts/Type1

  # install ttf fonts
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 ${srcdir}/culmus-$pkgver/*.ttf \
    ${pkgdir}/usr/share/fonts/TTF

  # install provided config file with priority 61
  install -d ${pkgdir}/etc/fonts/conf.avail/
  install -m644 ${srcdir}/culmus-$pkgver/culmus.conf \
    ${pkgdir}/etc/fonts/conf.avail/61-culmus.conf
}
