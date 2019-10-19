# Maintainer: Justin Williams <justin@justinandyadi.com>

pkgname=ldid2
pkgver=76.11f7ebc
pkgrel=1
pkgdesc="a tool used for ad-hoc codesigning iOS binaries - xerub's fork"
provides=('ldid' 'ldid2')
arch=('any')
url="https://github.com/xerub/ldid"
license=('custom')
makedepends=('git' 'clang')
optdepends=()
source=("git+https://github.com/xerub/ldid")
sha256sums=('SKIP')

pkgver() {
	cd ldid
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd ldid
	clang++ -I. -c -std=c++11 -o ldid.o ldid.cpp
	clang++ -I. -o ldid ldid.o -x c lookup2.c -x c sha1.c
	clang++ -I. -c -std=c++11 -o ldid2.o ldid2.cpp
	clang++ -I. -o ldid2 ldid2.o -x c lookup2.c -x c sha1.c -x c sha224-256.c
}

package() {
	cd ldid
	mkdir -p ${pkgdir}/usr/bin/
	install -Dm755 ldid ${pkgdir}/usr/bin/
	install -Dm755 ldid2 ${pkgdir}/usr/bin/
}
