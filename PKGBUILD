# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=g2sc
pkgver=0.2
pkgrel=5
pkgdesc="Samba gtk2 client"
arch=('x86_64')
url="http://sourceforge.net/projects/g2sc"
license=('GPL')
depends=('smbclient' 'gtk2')
source=(http://downloads.sourceforge.net/g2sc/${pkgver}/g2cs${pkgver}alpha-source.tar.bz2)
md5sums=('c0994584f2c950241bf7e2782cb4d2fd')

build() {
  cd "$srcdir"
  sed -i 's/-lsmbclient/-I\/usr\/include\/samba-4.0 -lsmbclient/g' makefile
  make
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/usr/{share/{g2sc,applications},bin}
  install -m644 g2sc.conf "$pkgdir"/usr/share/g2sc
  install -m644 g2sc.png "$pkgdir"/usr/share/g2sc
  install -m755 g2sc "$pkgdir"/usr/bin
  install -m644 g2sc.desktop "$pkgdir"/usr/share/applications
}
