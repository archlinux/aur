# Maintainer: Young Acinonyx <young [dot] acinonyx [at ] gmail [dot] com>

pkgname=skyscraper-git
pkgver=r2845.19832c4
pkgrel=1
pkgdesc="Powerful and versatile game scraper written in C++."
arch=('any')
url="https://github.com/muldjord/skyscraper"
license=('GPL')
makedepends=('qt5-base' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/muldjord/skyscraper.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i "s_/usr/local/etc_/etc_g" "$srcdir/${pkgname%-git}/${pkgname%-git}.pro"
	sed -i "s_/usr/local/bin_/usr/bin_g" "$srcdir/${pkgname%-git}/${pkgname%-git}.pro"
	sed -i "s_/usr/local/etc_/etc_g" "$srcdir/${pkgname%-git}/src/${pkgname%-git}.cpp"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" DESTDIR="$pkgdir/" install
}
