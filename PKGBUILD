_pkgname=kamoso
pkgname=$_pkgname-git
pkgver=r1410.311960b
pkgrel=1
pkgdesc="Kamoso is an application to take pictures and videos out of your webcam. Git version."
url="https://kde.org/applications/en/kamoso"
arch=('i686' 'x86_64')
license=('GPL')
depends=('purpose' 'kirigami2')
makedepends=('cmake' 'git' 'extra-cmake-modules' 'kdoctools')
conflicts=('kamoso')
provides=('kamoso')

source=("$_pkgname::git+https://invent.kde.org/multimedia/kamoso.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir"
	mkdir -p build
	cd build

	cmake "../$_pkgname" -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$srcdir/build"

	make DESTDIR="$pkgdir" install
}
