# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=nickvision-money-git
_pkgname=nickvisionmoney
pkgver=2022.11.1.beta1.r19.g35253b3
pkgrel=1
pkgdesc="A personal finance manager"
arch=('x86_64')
url=https://github.com/nlogozzo/$_pkgname
license=('GPL3')
depends=('jsoncpp' 'libadwaita' 'sqlitecpp')
makedepends=('boost' 'cmake' 'git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson $_pkgname build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
