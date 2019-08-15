# Maintainer: Young Acinonyx <young [dot] acinonyx [at ] gmail [dot] com>
pkgname=skyscraper-git
pkgver=r2047.194f8e9
pkgrel=1
pkgdesc="Powerful and versatile game scraper written in c++."
arch=("any")
url="https://github.com/muldjord/skyscraper"
license=('GPL')
groups=()
depends=()
makedepends=('qt5-base' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/muldjord/skyscraper.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i "s_/usr/local/etc_/etc_g" "$srcdir/${pkgname%-git}/${pkgname%-git}.pro"
	sed -i "s_/usr/local/bin_/usr/bin_g" "$srcdir/${pkgname%-git}/${pkgname%-git}.pro"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" DESTDIR="$pkgdir/" install
}
