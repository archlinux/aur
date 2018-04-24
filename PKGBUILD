# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=gull-git
pkgver=3.0.4.r0.g8981253
pkgrel=1
pkgdesc="A strong UCI chess engine created by Vadim Demichev"
arch=('i686' 'x86_64')
url="https://github.com/basil00/gull"
license=('custom')
depends=('gcc-libs')
makedepends=('git' 'wget')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}=${pkgver:0:5}")
source=("git+https://github.com/basil00/gull.git#tag=v0.4")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-*}"
	git describe --long --tags | sed 's/^v/3./;s/.win//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname%-*}/src/"
	mv Gull.cpp gull.cpp
	sed -i -e 's/Gull/gull/g' Makefile
}

build() {
	cd "${srcdir}/${pkgname%-*}/src/"
	make syzygy
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	install -m644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE
	install -Dm0755 ./src/gull ${pkgdir}/usr/bin/gull
}
