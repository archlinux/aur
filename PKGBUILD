# Maintainer: 9M2PJU <9m2pju@hamradio.my>

pkgname=qsstv-9m2pju-git
pkgver=r72.g85d9219
pkgrel=1
pkgdesc="Slow-Scan TV (SSTV) app for ham radio using Qt - Git version by 9M2PJU"
arch=('x86_64' 'i686')
url="https://github.com/ON4QZ/QSSTV"
license=('GPL')
depends=('qt5-base' 'libpulse' 'v4l-utils' 'hamlib' 'fftw' 'openjpeg2' 'alsa-lib')
makedepends=('git' 'qt5-base')
conflicts=('qsstv')
provides=('qsstv')
source=(
  'git+https://github.com/ON4QZ/QSSTV.git'
  'qsstv.desktop'
)
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/QSSTV"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/QSSTV"

  mkdir -p build
  cd build

  qmake-qt5 ../qsstv.pro PREFIX=/usr
  make
}

package() {
  cd "$srcdir/QSSTV/build"
  make INSTALL_ROOT="$pkgdir" install

  # Desktop entry
  install -Dm644 "$srcdir/qsstv.desktop" "$pkgdir/usr/share/applications/qsstv.desktop"
  install -Dm644 "$srcdir/QSSTV/src/icons/qsstv.png" "$pkgdir/usr/share/pixmaps/qsstv.png"
}
