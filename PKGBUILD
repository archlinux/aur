# Contributor: Chris Down <chris@chrisdown.name>
# Contributor: Yung Wood <yung at yung.com.au>
# Contributor: Joshua Stiefer <facedelajunk at gmail.com>
# Contributor: Michael Seiwald <michael at mseiwald.at>
# Contributor: Techlive Zheng <techlivezheng at gmail.com>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=lastpass-pocket
pkgver=3.1.40
pkgrel=2
pkgdesc="Backup and offline access for LastPass"
arch=('i686' 'x86_64')
url="https://lastpass.com"
license=('custom:LastPass')
options=('!strip')
depends=('ca-certificates' 'openssl>=1.0.0' 'libldap' 'libidn' 'gtk2' 'libpng12')
source=('lastpass.desktop' 'lastpass.png')
sha1sums=('4e8258a93d2a72c86abc916fee1faab0d34fc8a7'
          '043994fdbb2af48eadb17e2ffe48a9a1652c297b')
source_i686=(https://download.lastpass.com/pocket.tar.bz2)
sha1sums_i686=('80ca1bd2bf332f6021d66341e203f69f9e1abf05')
source_x86_64=(https://download.lastpass.com/pocket_x64.tar.bz2)
sha1sums_x86_64=('31e54f9bbab896061231b2590683e8ba1077ac8a')

package() {
  [ "$CARCH" == i686 ] && _pocket_bin=pocket
  [ "$CARCH" == x86_64 ] && _pocket_bin=pocket_x64
  install -Dm755 ${_pocket_bin} "${pkgdir}/usr/bin/lastpass"
  sed -i -e 's/libssl.so.0.9.8/libssl.so.1.0.0/g' -e 's/libcrypto.so.0.9.8/libcrypto.so.1.0.0/g' "${pkgdir}/usr/bin/lastpass"
  install -Dm644 lastpass.png "${pkgdir}/usr/share/icons/lastpass.png"
  install -Dm644 lastpass.desktop "${pkgdir}/usr/share/applications/lastpass.desktop"
}
