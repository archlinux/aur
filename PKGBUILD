# Maintainer: Thiago Almeida <thiagoalmeidasa at gmail dot com>
# Contributor: Christopher Heien <chris.h.heien@gmail.com>
# Contributor: Stéphane Brunet <stephane at stephanebrunet dot net>

pkgname=iscan-plugin-gt-s80
pkgver=0.2.1
pkgrel=2
pkgdesc="iscan plugin for Epson GT-S50 and GT-S80 scanner."
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom')
depends=('iscan' 'iscan-data')
optdepends=('iscan-plugin-esdip: provides auto-crop and deskew function')
makedepends=('deb2targz')
install=gt-s80.install
source=(http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/01/79/56/4ba44418d108b168a9416282fb7fab4eea801e8d//esci-interpreter-gt-s80_${pkgver}-1_i386.deb)
[[ $CARCH == "x86_64" ]] && \
source=(http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/01/79/56/44ac63b545bcd7fc7fd12ae05b605b0d3c85ea72/esci-interpreter-gt-s80_${pkgver}-1_amd64.deb)
md5sums=('678c3ca4a1ae769fff9cbf466646cd86')
[[ $CARCH == "x86_64" ]] && md5sums=('fe4ef040c8a6e48a8aeafd845288f7bd')
package() {
  cd $srcdir
  deb2targz $(basename ${source[0]})
  tar -xf $(basename ${source[0]//.deb/.tar.gz})
  mv usr ${pkgdir}/
  mkdir $pkgdir/usr/share/licences
  mv ${pkgdir}/usr/share/doc/* $pkgdir/usr/share/licences/
  rmdir $pkgdir/usr/share/doc
}
