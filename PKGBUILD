# Maintainer: frames <markkuehn at outlook dot com>

_pkgname=kamoso
pkgname=$_pkgname-git
pkgver=908.5cf48dd
pkgrel=1
pkgdesc="Kamoso is an application to take pictures and videos out of your webcam. Git version."
url="https://projects.kde.org/projects/extragear/multimedia/kamoso"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt5-gstreamer' 'libkipi')
makedepends=('cmake' 'git' 'purpose-git')
conflicts=('kamoso')
provides=('kamoso')

source=("git://anongit.kde.org/kamoso/")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
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
