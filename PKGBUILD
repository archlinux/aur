# Maintainer: Alf Gaida <agaida@siduction.org>

_pkgname=lxqt-kcm-integration
pkgname=$pkgname-git
pkgver=0.0.1
pkgrel=1
pkgdesc="LXQt KCM Integration"
arch=("x86_64")
url="http://lxqt.org"
license=("LGPL2")
depends=("kde-cli-tools" "kglobalaccel" "kwin" "plasma-workspace")
optdepends=('bluedevil: needed for lxqt-kcm-bluetooth'
            'kde-gtk-config: needed for lxqt-kcm-appearance'
            'kinfocenter: needed for lxqt-kcm-systeminfo'
            'plasma-desktop: needed for lxqt-kcm-appearance colors and styles')
makedepends=("git" "cmake")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=("SKIP")


pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
