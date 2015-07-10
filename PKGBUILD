# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgbase="sddm"
pkgname="$_pkgbase-git"
pkgver=0.10.0.56.gd6a9dea
pkgrel=1
pkgdesc="The Simple Desktop Display Manager"
arch=("i686" "x86_64")
url="https://github.com/sddm/sddm"
license=("GPL")
depends=("qt5-declarative" "upower")
makedepends=("git" "cmake" "qt5-tools" "python-docutils")
provides=("$_pkgbase" "display-manager")
conflicts=("$_pkgbase" "display-manager")
install="$_pkgbase.install"
backup=("usr/share/sddm/scripts/Xsetup")
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
