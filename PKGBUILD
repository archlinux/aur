# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgbase="sddm"
pkgname="$_pkgbase-git"
pkgver=0.14.0.29.g078c4d8
pkgrel=1
pkgdesc="The Simple Desktop Display Manager"
arch=("i686" "x86_64")
url="https://github.com/sddm/sddm"
license=("GPL")
depends=("qt5-declarative" "upower")
makedepends=("git" "cmake" "extra-cmake-modules" "qt5-tools" "python-docutils")
provides=("$_pkgbase" "display-manager")
conflicts=("$_pkgbase" "display-manager")
install="$_pkgbase.install"
backup=(
	"usr/share/sddm/scripts/Xsetup"
	"etc/sddm.conf"
)
source=("git+https://github.com/sddm/$_pkgbase.git")
sha256sums=("SKIP")


pkgver() {
	cd "$srcdir/$_pkgbase"
	git describe --always | sed "s/^v//g" | sed "s/-/./g"
}

build() {
	mkdir -p build

	cd build
	cmake "$srcdir/$_pkgbase" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/sddm \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_MAN_PAGES=ON
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
