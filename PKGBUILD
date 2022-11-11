# Maintainer: Bohdan <bohdan@manko.pro>

pkgname=qsstv-git
pkgver=r50.c5be1e3
pkgrel=1
epoch=
pkgdesc="Radio Slow-Scan TV for qt"
arch=('i686' 'x86_64')
url="https://github.com/ON4QZ/QSSTV"
license=('GPL')
groups=()
depends=('qt5-base' 'libpulse' 'v4l-utils' 'hamlib' 'fftw' 'openjpeg2' 'alsa-lib')
makedepends=("gcc" "make")
checkdepends=()
optdepends=()
provides=()
conflicts=('qsstv')
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/ON4QZ/QSSTV')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "QSSTV"
	if [ ! -d "src/build" ]
	then
		mkdir src/build
		cd src/build
		qmake-qt5 PREFIX=/usr/ ..
		make $MAKEOPTS
	fi
}

package() {
  cd "$srcdir/QSSTV/src/build"

  mkdir -p "$pkgdir/usr/bin/"
  make INSTALL_ROOT="$pkgdir" install

  cd "$srcdir/QSSTV"
  install -D -m644 "qsstv.desktop" "$pkgdir/usr/share/applications/qsstv.desktop"
  install -D -m644 "$srcdir/QSSTV/src/icons/qsstv.png" "$pkgdir/usr/share/pixmaps/qsstv.png"
}

pkgver() {
  cd "QSSTV"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

