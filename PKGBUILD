# Maintainer: João Figueiredo <jf dot mundox at gmail dot com> 

pkgname=elf-dissector-git
pkgver=r775.6659853
pkgrel=1
pkgdesc="Static analysis tool for ELF libraries and executables"
arch=('x86_64')
url="https://invent.kde.org/sdk/elf-dissector"
license=('GPL')
depends=('harfbuzz' 'hicolor-icon-theme' 'libdwarf' 'qt5-base')
optdepends=('capstone: disassembler'
	    'gnuplot: performance plot')
makedepends=('extra-cmake-modules' 'git' 'kitemmodels')
source=('git+https://github.com/KDE/elf-dissector.git')
sha256sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${pkgname%-git}
	mkdir -p build
	cd build
	cmake ..
	make
}

package() {
	cd ${pkgname%-git}/build
	make DESTDIR="$pkgdir" install
}
