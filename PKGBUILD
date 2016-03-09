# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=gull-git
pkgver=3.0.3.r1.g9a6eea8
pkgrel=1
pkgdesc="A strong UCI chess engine created by Vadim Demichev"
arch=('i686' 'x86_64')
url="https://github.com/basil00/gull"
license=('custom')
depends=('')
makedepends=('git' 'wget')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}=${pkgver}")
options=(!emptydirs)
source=("git+https://github.com/basil00/gull.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-*}"
	git describe --long --tags | sed 's/^v/3./;s/.win//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname%-*}/src/"
	make syzygy
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	install -m644 -D LICENSE ${pkgdir}/usr/share/licences/${pkgname%-*}/LICENSE
	install -Dm0755 ./src/Gull ${pkgdir}/usr/bin/gull
}
