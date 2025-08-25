# Maintainer: User8395 <therealuser8395@proton.me>
pkgname=plasma-settings-git
pkgver=25.07.0.r15.gff79940
pkgrel=1
pkgdesc="Settings application for Plasma Mobile"
arch=('any')
url="https://www.plasma-mobile.org/"
license=('GPL2')
groups=()
depends=('kio' 
	'ki18n' 
	'plasma-workspace'
	'kdeclarative' 
	'kcmutils' 
	'knotifications'
	'kwindowsystem'
	)

makedepends=('cmake' 'extra-cmake-modules') 
conflicts=('plasma-settings')
source=('git+https://invent.kde.org/plasma-mobile/plasma-settings.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "plasma-settings"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/plasma-settings"
	cmake -B build \
	      -DCMAKE_INSTALL_PREFIX="/usr" 

	cmake --build build
}

package() {
	cd "$srcdir/plasma-settings/build"
	make DESTDIR="$pkgdir/" install
}
