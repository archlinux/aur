# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=protector-svn
pkgver=1.9.0.r1134
pkgrel=1
pkgdesc="Yet another UCI chess engine"
arch=('x86_64')
url="https://sourceforge.net/projects/protector"
license=('GPL')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}=${pkgver:0:5}")
source=("${pkgname%-*}::svn://svn.code.sf.net/p/${pkgname%-*}/code/")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	local ver="$(svnversion)"
	printf "${pkgver:0:5}.r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	cd "$srcdir/${pkgname%-*}/src/"
	sed -i -e 's/Protector/protector/g' Makefile
}

build() {
	cd "$srcdir/${pkgname%-*}/src/"
	make TARGET=LINUX_64 
}

package() {
	cd "$srcdir/${pkgname%-*}/src/"
	install -Dm0755 ${pkgname%-*} ${pkgdir}/usr/bin/${pkgname%-*}
}
