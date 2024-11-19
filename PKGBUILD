# Maintainer: Michael Gerdau <mgd@qata.de>
# Maintainer: Jon Arnold <jonarnoldsemail at gmail dot com>
# Contributor: Xiao-Long Chen
pkgname=pacpl
pkgver=6.1.3
pkgrel=2
pkgdesc="Convert multiple audio types from one format to another."
arch=('any')
#url="http://pacpl.sourceforge.net/"
url="https://sourceforge.net/projects/pacpl/"
license=('GPL')
depends=(
  'perl'
  'perl-parallel-forkmanager'
  'perl-cddb'
  'perl-mp3-tag'
  'perl-audio-scan'
  'perl-audio-flac-header'
  'cddb_get'
)
optdepends=(
  'aften'
#  'avconv'
#  'bladeenc'
#  'bonk'
  'cdparanoia'
  'faac'
  'faad2'
  'ffmpeg'
  'flac'
#  'la'
  'lame'
  'libogg'
  'lpac'
  'mac'
  'mplayer'
  'musepack-tools'
  'opus-tools'
  'optimfrog'
  'perl-audio-musepack'
  'perl-inline'
  'perl-mp3-info'
  'perl-mp4-info'
  'perl-ogg-vorbis-header'
  'perl-parse-recdescent'
  'perl-string-shellquote'
  'perl-switch'
  'shorten'
  'sox'
  'speex'
  'ttaenc'
  'vorbis-tools'
  'wavpack'
)
#install=${pkgname}.install
#source=(git://git.code.sf.net/p/pacpl/code)
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2"
	"pacpl.conf.patch"
	"pacpl.in.patch")
md5sums=('3b1949c90200204fbfaa4c59be65cf96'
	 '6a9358e5fc278eb32d09a5d539651252'
	 '8c9bf17b8d14a93a67b7cf99aaacefcd')
sha512sums=('8978ee43cc6cea4588fd2f62c3ae448a554d364f3c2d097b358a57d61aea46fd8c4a105b48212f1c74795e37289cf419894809112499ad0cb7437ecfce423783'
	    '3a68a6907bb87c764623065f906856b64ba3160d3963e6fb156dc8bff495aadb42f9cfa8d18db3a8819d755859a268d63e9be9e3dd3f86434ccd1c2d117936cd'
	    '9c61cc0d7f60d49ab331037e662c6b6af2abb7a1ee08f1e58dd668405c70e2871966cd94bb4270d0f4014ca32bdccd41c7fd35ad1bb446d4b81603ba03e75e14')
makedeps=(
  'autoconf'
)

prepare() {
  patch -Np1 -i pacpl.conf.patch
  patch -Np1 -i pacpl.in.patch
}

build() {
  cd "${srcdir}/$pkgname-code"
  autoconf
  ./configure
  if [ ! -e TODO ]; then touch TODO; fi
  make
}

package() {
  cd "${srcdir}/$pkgname-code"
  test -f ChangeLog.txt && cp -p ChangeLog.txt ChangeLog
  make DESTDIR="${pkgdir}" install
  rm -rvf ${pkgdir}/usr/share/apps
}
# vim:syntax=sh
