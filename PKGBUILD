# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=plank-player-git
pkgver=5.26.90.r246.g9212ad5
pkgrel=1
pkgdesc="Multimedia Player for playing local files on Plasma Bigscreen allowing navigation with just a remote control (Git version)"
arch=('any')
url="https://invent.kde.org/plasma/plank-player"
license=('GPL2')
groups=()
depends=('plasma-bigscreen-git' 'qt6-multimedia' 'hicolor-icon-theme')
makedepends=('cmake' 'extra-cmake-modules-git')
conflicts=('plank-player')
source=('git+https://invent.kde.org/plasma/plank-player')
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "plank-player"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/plank-player"
	cmake -B build \
	      -DBUILD_TESTING="OFF" 
	cmake --build build
}

package() {
	cd "$srcdir/plank-player/build"
	DESTDIR="$pkgdir/" make install
}
