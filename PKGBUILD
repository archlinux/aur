# Maintainer: zlowly <zlowly@gmail.com>
pkgname=wqy-microhei-nightly_build
_pkgname=wqy-microhei
pkgver=0.2
pkgrel=6
pkgdesc="A Sans-Serif style high quality CJK outline font. This is a nightly-build version."
arch=('any')
license=('GPL3' 'APACHE' 'custom:"font embedding exception"')
install=${pkgname}.install
url="http://wenq.org"
depends=('fontconfig' 'xorg-font-utils')
conflicts=('wqy-microhei')
provides=('wqy-microhei')
source=("http://wenq.org/daily/microhei/${_pkgname}-${pkgver}.NB-nightlybuild.tar.gz" "44-wqy-microhei.conf")
md5sums=(SKIP '2614129902fda4e45aa7f0f7b635cc4f')
build() {
  cd $srcdir/${_pkgname}
  tail README.txt --lines=16|head --lines=-3>| FONTEXCEPTION
}

package() {
  cd $pkgdir
  mkdir -p usr/share/fonts/wenquanyi/${_pkgname}
  mkdir -p usr/share/licenses/${_pkgname}
  mkdir -p etc/fonts/conf.avail/
  mkdir -p etc/fonts/conf.d/
  cd $srcdir
  install -m644 *.conf $pkgdir/etc/fonts/conf.avail/ || return 1
  cd ${_pkgname}
  install -m644 -D FONTEXCEPTION $pkgdir/usr/share/licenses/${_pkgname}/FONTEXCEPTION || return 1
  install -m644 *.ttc $pkgdir/usr/share/fonts/wenquanyi/${_pkgname}/ || return 1
  cd $pkgdir/etc/fonts/conf.d/
  ln -s ../conf.avail/44-wqy-microhei.conf .
}
# vim:set ts=2 sw=2 et:
