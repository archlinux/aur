# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=firenzina-git
pkgver=2.4.1.r40.17c9150
pkgrel=1
pkgdesc="A free, open-source UCI chess engine, a derivative of Fire 2.2 xTreme [git version]"
arch=('i686' 'x86_64')
url="https://github.com/Censor/Firenzina"
license=('GPL')
depends=('glibc')
makedepends=('git')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}=${pkgver:0:5}")
source=("git+https://github.com/Censor/${pkgname%-*}.git"
	"makefile.patch")
md5sums=('SKIP'
	 "44f3e93f6ba92567161596903091ae21")

pkgver() {
	cd "${srcdir}/${pkgname%-*}"
	printf "%s.r%s.%s" "${pkgver:0:5}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname%-*}/src/"
	patch -Np1 -i "${srcdir}/makefile.patch"
}

build() {
	cd "${srcdir}/${pkgname%-*}/src/"
	make
}

package() {
	cd "${srcdir}/${pkgname%-*}/src/"
	install -Dm0755 ${pkgname%-*} ${pkgdir}/usr/bin/${pkgname%-*}
}
