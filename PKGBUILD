# Maintainer: locked_sh <locked.shadow at openmailbox.org> 

pkgname=cirnosay-git
pkgver=r13.f2a2732
pkgrel=2
pkgdesc="Baka for terminal"
arch=('i686' 'x86_64')
url="https://github.com/yuzurufag/cirnosay"
license=('unknown')
depends=('imlib2')
makedepends=('git' 'cmake' 'imagemagick')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./download_pictures.sh
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
