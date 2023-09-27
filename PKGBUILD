# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Zanny <lordzanny@gmail.com>

pkgname=clinfo-git
pkgver=3.0.23.01.25.r5.g47c78bf
pkgrel=1
pkgdesc="Print all known information about all available OpenCL platforms and devices in the system"
arch=(i686 x86_64)
url="https://github.com/Oblomov/clinfo"
license=('custom:Public Domain')
depends=(opencl-icd-loader)
makedepends=(git opencl-headers)
provides=(clinfo)
conflicts=(clinfo)
replaces=(clinfo)
source=(git+https://github.com/oblomov/clinfo.git)
md5sums=('SKIP')

function pkgver() {
	cd clinfo
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	cd clinfo
	make
}

package() {
	cd clinfo
	make PREFIX="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
