# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=qvtf-git
pkgver=r21.bd8fd96
pkgrel=6
pkgdesc="QImageIO plugin to load Valve Texture Files in QT 5 Programs (View VTF in QT 5 Programs)"
arch=('x86_64')
url="https://github.com/HurricanePootis/qvtf"
license=('GPL')
depends=('libvtflib-git' 'qt5-base')
makedepends=('cmake' 'git' 'gcc')
source=("git+https://github.com/HurricanePootis/qvtf.git")
md5sums=('SKIP')


pkgver() {
 cd "$srcdir/qvtf"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd qvtf
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
	make
}

package() {
	cd "$srcdir/qvtf"
	make install DESTDIR="$pkgdir"
	cd "$pkgdir/usr/lib"
	mv qt5 qt
}
