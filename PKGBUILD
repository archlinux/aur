# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $

pkgname=pppd-ldap-simple
pkgver=0.12b
pkgrel=8
pkgdesc="pppd ldap simple plugin (based on pppd ldap, without radius, etc. Just search by uid and userPassword)"
arch=('x86_64')
url="http://sourceforge.net/projects/pppd-ldap/"
makedepends=('ppp' 'libldap')
license=('GPL')
source=(http://archlinux-stuff.googlecode.com/files/pppd_ldap-simple-$pkgver.tar.gz)
md5sums=('e47b7fb5119a1024e188ec22351672cd')

build() {
  cd "$srcdir/pppd_ldap-simple-$pkgver"
  make CFLAGS="-I/usr/include/pppd -fPIC"
}

package() {
  _pppdver=`pacman -Q ppp | cut -d\  -f 2  | cut -f 1 -d -`
  depends=("ppp=${_pppdver}" 'libldap>=2.4.18')

  cd "$srcdir/pppd_ldap-simple-$pkgver"
  install -D -m0755 pppd_ldap.so "$pkgdir"/usr/lib/pppd/${_pppdver}/pppd_ldap_simple.so
}
