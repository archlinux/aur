# Maintainer: Marius Orcsik <marius.orcsik@gmail.com>
pkgname=plasma-wallpaper-snow-git
pkgver=r5.89d9d94
pkgrel=1
pkgdesc="Plasma Wallpaper Snow from Ivan Safonov"
arch=("any")
url="https://github.com/IvanSafonov/plasma-wallpaper-snow"
license=('GPL')
depends=('plasma-workspace')
makedepends=('git' 'cmake') 
provides=("${pkgname%-/git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/IvanSafonov/plasma-wallpaper-snow.git')
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
