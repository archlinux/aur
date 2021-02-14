# Maintainer: Michael Gerdau <mgd@qata.de>
# Maintainer: Jon Arnold <jonarnoldsemail at gmail dot com>
# Contributor: Xiao-Long Chen
pkgname=pacpl
pkgver=6.1.3
pkgrel=1
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
  'avconv'
  'bladeenc'
  'bonk'
  'cdparanoia'
  'faac'
  'faad2'
  'ffmpeg'
  'flac'
  'la'
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
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('3b1949c90200204fbfaa4c59be65cf96')
makedeps=(
  'autoconf'
)

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
