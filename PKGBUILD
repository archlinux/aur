pkgname=qmidiplayer
pkgver=0.8.5
pkgrel=1
pkgdesc="A cross-platform midi file player based on libfluidsynth and Qt."
arch=('i686' 'x86_64')
url="https://chrisoft.org/QMidiPlayer/"
license=('GPL')
depends=('qt5-base' 'qt5-quickcontrols' 'rtmidi' 'fluidsynth' 'freetype2' 'zlib' 'libjpeg-turbo' 'libpng' 'glfw' 'glew')
provides=(qmidiplayer)
source=("$pkgname-$pkgver-src.zip::https://github.com/chirs241097/QMidiPlayer/archive/master.zip"
	"$pkgname-$pkgver-src_smelt.zip::https://github.com/BearKidsTeam/SMELT/archive/master.zip")
md5sums=('SKIP' 'SKIP')

build() {
  cd "$srcdir/SMELT-master"
  make
  cd "$srcdir/QMidiPlayer-master"
  export QMP_BUILD_MODE=1
  SMELT_DIR="$srcdir/SMELT-master" qmake PREFIX="$pkgdir/usr/"
  make
}

package() {
  cd "$srcdir/QMidiPlayer-master"
  make install
}
