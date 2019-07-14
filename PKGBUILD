# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=nootka-hg
pkgver=r1996.a8fc39b7f1de
pkgrel=1
pkgdesc="A crossplatform tool for learning classical score notation. Mostly for guitarists but also very good for ear training. (mercurial version)"
arch=('x86_64' 'i686')
url="http://nootka.sourceforge.net/"
license=('GPL3')
depends=('qt5-base' 'fftw' 'shared-mime-info' 'libvorbis' 'soundtouch' 'alsa-lib')
optdepends=(
'libpulse: for PulseAudio'
'jack: for JACK'
'qt5-translations: for other languages support'
)
conflicts=('nootka')
makedepends=('cmake' 'qt5-base' 'fftw' 'libvorbis' 'soundtouch' 'alsa-lib')
source=("${pkgname}"::'hg+http://hg.code.sf.net/p/nootka/hg')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/nootka-hg"
  [ ! -d build ] && mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd "$srcdir/nootka-hg/build"
  make DESTDIR="$pkgdir/" install
} 
