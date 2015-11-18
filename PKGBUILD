# Maintainer: wicast <wicastchen@hotmail.com>

pkgname=clessc-git 
pkgver=r425.9798e3e
pkgrel=2
pkgdesc="A C++ implementation of the LESS CSS Compiler"
arch=('i386' 'x86_64')
url="https://github.com/BramvdKroef/clessc"
license=('GPLv3')
groups=()
depends=('libpng' 'libjpeg' 'google-glog')
makedepends=('git') 
provides=("clessc")
conflicts=("clessc")
replaces=("clessc")
backup=()
options=()
source=("${pkgname%-git}::git+https://github.com/BramvdKroef/clessc")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr --program-prefix=c
    make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
