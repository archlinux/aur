# Maintainer: Pierre Choffet <peuc@wanadoo.fr>

# Note: unlike the ring-daemon-git and libringclient-git, this package doesn't
# use pinned commit, so you may encounter some compatibility issues with lower
# level librairies if their packages are not updated. In this case, just append
# #commit=<commit_id> in source url.

pkgname=ring-kde-git
pkgver=2.0.0.r177.g49fb1c3
pkgrel=1
pkgdesc="KDE client for Ring"
arch=("i686" "x86_64")
url="http://ring.cx/"
license=("GPL3")
groups=("ring")
depends=("libringclient-git" "ring-daemon-git" "qt5-base" "qt5-svg"
         "attica-qt5" "kconfig" "kguiaddons" "kdbusaddons" "ki18n"
         "kwindowsystem" "kxmlgui" "kiconthemes" "kinit" "kio" "kcompletion"
         "kcrash" "kdelibs" "knotifications")
makedepends=("git" "cmake" "extra-cmake-modules")
provides=("ring-kde")
changelog="ChangeLog"
source=("git://anongit.kde.org/ring-kde")
sha256sums=('SKIP')

pkgver() {
	cd "ring-kde"

	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "ring-kde"
}

build() {
	cd "ring-kde"

	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release

	make
}

package() {
	cd "ring-kde/build"

	make DESTDIR="$pkgdir" install
}
