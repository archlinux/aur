# $Id: PKGBUILD 148464 2015-12-05 15:21:48Z bpiotrowski $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=silly
pkgver=0.1.0
pkgrel=7
pkgdesc="Simple Image Loading LibrarY, a part of the CEGUI project"
arch=('i686' 'x86_64')
url="http://www.cegui.org.uk/wiki/index.php/SILLY"
license=('MIT')
depends=('libjpeg' 'libpng' 'gcc-libs')
source=(http://downloads.sourceforge.net/crayzedsgui/SILLY-${pkgver}.tar.gz
        silly-libpng1.5.patch)
md5sums=('c3721547fced7792a36ffc9ce6ec23fd'
         '530551c2942aea6fa20f10d06f1e604f')

build() {
  cd "${srcdir}/SILLY-${pkgver}"

  patch -Np1 < $srcdir/silly-libpng1.5.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/SILLY-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
