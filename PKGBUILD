# Maintainer: Marco Gulino <marco.gulino@gmail.com>

pkgname=screenrotator-git
pkgver=r23.1a78a4b
pkgrel=1
epoch=1
pkgdesc='Automatic screen rotation daemon for X11'
arch=('i686' 'x86_64')
url='https://github.com/GuLinux/ScreenRotator'
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'libxi' 'libxrandr' 'qt5-sensors')
makedepends=('git' 'cmake' 'qt5-tools')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
	install -d build
}

build() {
    cd "$srcdir/$pkgname/build"
	cmake ..\
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
    cd "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir" install
}
