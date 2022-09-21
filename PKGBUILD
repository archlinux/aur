# Maintainer: JackMacWindows <jackmacwindowslinux@gmail.com>
pkgname=sanjuuni-ui-git
pkgver=0.1~3+3a62e37
pkgrel=1
epoch=
pkgdesc="GUI tool for sanjuuni, which converts images and videos into a format that can be displayed in ComputerCraft."
arch=('x86_64' 'i386' 'armv7l' 'armv7h' 'aarch64' 'powerpc' 'ppc64el' 's390x' 'riscv64' 'riscv32')
url="https://github.com/MCJack123/sanjuuni-ui"
license=('GPL')
groups=()
depends=('qt5-base' 'ffmpeg' 'poco' 'zlib')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("sanjuuni-ui::git+https://github.com/MCJack123/sanjuuni-ui.git")
noextract=()
sha256sums=(SKIP)
validpgpkeys=()

prepare() {
	cd "sanjuuni-ui"
	git submodule update --init --recursive
}

pkgver() {
    cd "sanjuuni-ui"
    #echo "$(curl -sL https://api.github.com/repos/MCJack123/sanjuuni-ui/releases/latest | grep tag_name | grep -o '[0-9][^"]*')~$(git rev-list --count HEAD)+$(git rev-parse --short HEAD)"
    echo "0.1~$(git rev-list --count HEAD)+$(git rev-parse --short HEAD)"
}

build() {
	cd "sanjuuni-ui"
    mkdir -p build
    cd build
    # Prefer Qt 5 over Qt 6: this allows Breeze to work on KDE 5 systems where Qt 6 is installed
	cmake -DCMAKE_FIND_PACKAGE_SORT_ORDER=NAME -DCMAKE_FIND_PACKAGE_SORT_DIRECTION=ASC ..
	cmake --build .
}

check() {
	true
}

package() {
	cd "sanjuuni-ui/build"
	install -D -m 0755 sanjuuni-ui "$pkgdir/usr/bin/sanjuuni-ui"
}
