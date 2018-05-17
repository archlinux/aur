# Maintainer: Laurens Hazewinkel <laurens dot hazewinkel at gmail dot com>

pkgname=stressapptest-git
pkgver=1.0.8.r10.gdd550fc
pkgrel=1
pkgdesc="Stressful Application Test (or stressapptest, its unix name)"
arch=('i686' 'x86_64')
url="https://github.com/stressapptest/stressapptest"
license=('APACHE')
depends=('gcc-libs' 'libaio')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/${pkgname%-git}/${pkgname%-git}")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="${pkgdir}" install
}
