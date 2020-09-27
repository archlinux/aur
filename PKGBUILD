# Maintainer: Bruno Bollos Correa <bollos@outlook.com.br>
pkgname=vartypes-qt5-git
pkgver=r20.2d16e81
pkgrel=1
pkgdesc="Vartypes, but Qt5!"
arch=('x86_64')
url="https://github.com/jpfeltracco/vartypes"
license=('LGPL3')
depends=('glibc' 'qt5-base')
makedepends=('git' 'cmake')
provides=('vartypes-qt5')
conflicts=('vartypes-qt5')
source=('git+https://github.com/jpfeltracco/vartypes.git')
sha256sums=('SKIP')

pkgver() {
	cd vartypes
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/vartypes
	mkdir builddir && cd builddir
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd $srcdir/vartypes/builddir
	make DESTDIR="$pkgdir" install
}
