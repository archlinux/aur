# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=soundtouch-svn
pkgver=r255
pkgrel=1
pkgdesc="Audio processing library for changing the tempo, pitch and playback rates of audio streams or audio files"
arch=('i686' 'x86_64')
url="https://www.surina.net/soundtouch/"
license=('LGPL')
depends=('glibc')
makedepends=('git')
provides=('soundtouch')
conflicts=('soundtouch')
source=("svn+https://svn.code.sf.net/p/soundtouch/code/trunk")
sha256sums=('SKIP')


pkgver() {
  cd "trunk"

  _ver="$(svnversion)"
  printf "r%s" "${_ver//[[:alpha:]]}"
}

build() {
  cd "trunk"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

package() {
  cd "trunk"

  make DESTDIR="$pkgdir" install

  rm "$pkgdir/usr/share/doc/soundtouch/COPYING.TXT"
}
