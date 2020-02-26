# Maintainer: Librewish <librewish@gmail.com>
# Contributor: Alf Gaida <agaida@siduction.org>

_pkgname=lxqt-kcm-integration
pkgname=$_pkgname-git
pkgver=r31.f5995a0
pkgrel=1
pkgdesc="LXQt KCM Integration"
arch=("i686" "x86_64")
url="http://lxqt.org"
license=("LGPL2")
depends=("kde-cli-tools" "kglobalaccel" "kwin" "plasma-workspace")
optdepends=('bluedevil: needed for lxqt-kcm-bluetooth'
            'kde-gtk-config: needed for lxqt-kcm-appearance'
            'kinfocenter: needed for lxqt-kcm-systeminfo'
            'plasma-desktop: needed for lxqt-kcm-appearance colors and styles'
)
makedepends=("git" "cmake" "lxqt-build-tools-git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=("SKIP")


pkgver() {
	cd "$srcdir/lxqt-kcm-integration"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

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
