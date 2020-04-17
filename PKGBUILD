# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=nootka-git
pkgver=r3683.29c8ac7e
pkgrel=1
pkgdesc="Tool for learning classical score notation (git)"
arch=('x86_64' 'i686')
url="http://nootka.sourceforge.net/"
license=('GPL3')
depends=('qt5-base' 'fftw' 'shared-mime-info' 'libvorbis' 'soundtouch' 'alsa-lib')
optdepends=(
'libpulse: for PulseAudio'
'jack: for JACK'
'qt5-translations: for other languages support'
)
conflicts=('nootka' 'nootka-hg')
replaces=('nootka-hg')
makedepends=('cmake' 'qt5-base' 'fftw' 'libvorbis' 'soundtouch' 'alsa-lib' 'git')
source=("${pkgname}"::'git+https://www.opencode.net/seelook/nootka.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/nootka-git"
  [ ! -d build ] && mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd "$srcdir/nootka-git/build"
  make DESTDIR="$pkgdir/" install
}
