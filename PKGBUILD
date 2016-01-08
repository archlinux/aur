# Contributor: Chris Down <chris@chrisdown.name>
# Contributor: Yung Wood <yung at yung.com.au>
# Contributor: Joshua Stiefer <facedelajunk at gmail.com>
# Contributor: Michael Seiwald <michael at mseiwald.at>
# Contributor: Techlive Zheng <techlivezheng at gmail.com>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=lastpass-pocket
pkgver=3.2.16
pkgrel=2
pkgdesc="Backup and offline access for LastPass"
arch=('i686' 'x86_64')
url="https://lastpass.com"
license=('custom:LastPass')
options=('!strip')
depends=('ca-certificates' 'openssl>=1.0.0' 'libldap' 'libidn' 'gtk2' 'libpng12' 'rtmpdump')
source=('lastpass.desktop' 'lastpass.png')
sha1sums=('4e8258a93d2a72c86abc916fee1faab0d34fc8a7'
          '043994fdbb2af48eadb17e2ffe48a9a1652c297b')
sha1sums_i686=('4e09423dae6c4e7997bea41238ea3060d29aaa25')
sha1sums_x86_64=('ec44400081cf5dd841a4bdcbaa3d72f3e83b61b4')
source_i686=("pocket_${pkgver}.tar.bz2::https://download.lastpass.com/pocket.tar.bz2")
source_x86_64=("pocket_x64_${pkgver}.tar.bz2::https://download.lastpass.com/pocket_x64.tar.bz2")

package() {
  [ "$CARCH" == i686 ] && _pocket_bin=pocket
  [ "$CARCH" == x86_64 ] && _pocket_bin=pocket_x64
  install -Dm755 ${_pocket_bin} "${pkgdir}/usr/bin/lastpass"
  sed -i -e 's/libssl.so.0.9.8/libssl.so.1.0.0/g' \
  		 -e 's/libcrypto.so.0.9.8/libcrypto.so.1.0.0/g' \
  		 -e 's/librtmp.so.0/librtmp.so.1/g' \
  		 "${pkgdir}/usr/bin/lastpass"
  install -Dm644 lastpass.png "${pkgdir}/usr/share/icons/lastpass.png"
  install -Dm644 lastpass.desktop "${pkgdir}/usr/share/applications/lastpass.desktop"
}
