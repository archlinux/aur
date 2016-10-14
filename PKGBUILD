# Maintainer: Marius Orcsik <marius.orcsik@gmail.com>
pkgname=plasma-wallpaper-himawari-git
pkgver=r7.2049a94
pkgrel=1
pkgdesc="Plasma Wallpaper Himawari"
arch=("any")
url="https://github.com/Hyperz/plasmahimawari"
license=('GPL')
depends=('plasma-workspace')
makedepends=('git' 'cmake' 'extra-cmake-modules') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Hyperz/plasmahimawari.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

    # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
