# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=qsstv-9m2pju-git
pkgver=r72.g85d9219
pkgrel=1
pkgdesc="Amateur Radio Slow-Scan TV (SSTV) and Digital SSTV (DSSTV) software for Qt"
arch=('x86_64')
url="https://github.com/ON4QZ/QSSTV"
license=('GPL')
depends=('qt5-base' 'libpulse' 'v4l-utils' 'hamlib' 'fftw' 'openjpeg2' 'alsa-lib')
makedepends=('git' 'qt5-tools')
provides=('qsstv')
conflicts=('qsstv' 'qsstv-git')
source=("git+https://github.com/ON4QZ/QSSTV.git"
        "qsstv.desktop")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/QSSTV"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/QSSTV"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$srcdir/QSSTV"

  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 "$srcdir/qsstv.desktop" "$pkgdir/usr/share/applications/qsstv.desktop"
  install -Dm644 "src/icons/qsstv.png" "$pkgdir/usr/share/pixmaps/qsstv.png"
}
