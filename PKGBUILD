# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=imgpatchtools
pkgver=0.3.r5.g64a745d
pkgrel=1
pkgdesc="Patch img files with system.patch.dat, like OTA zip on PC"
arch=('any')
url="https://github.com/erfanoabdi/imgpatchtools"
license=('GPL')
depends=('zlib' 'bzip2' 'openssl')
makedepends=('git')
source=("git+https://github.com/erfanoabdi/$pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/$pkgname"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/$pkgname"
	sed -i 's:data, long size:data, long long size:' blockimg/blockimg.cpp
}

build() {
	cd "${srcdir}/$pkgname"
	make all
}

package() {
	cd "${srcdir}/$pkgname"
	install -d "${pkgdir}/usr/bin/"
	install -Dm0755 ./bin/* "${pkgdir}/usr/bin/"
}
