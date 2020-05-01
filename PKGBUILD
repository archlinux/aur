# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname="zlib-ng-git"
pkgver=1.9.9
pkgrel=1
epoch=2
pkgdesc="zlib replacement with optimizations for \"next generation\" systems"
arch=(
	"any"
)
url="https://github.com/zlib-ng/zlib-ng"
license=(
	"custom"
)
depends=(
	"glibc"
)
makedepends=(
	"cmake"
	"git"
)
provides=(
	"zlib=1.2.11"
	"zlib-ng=1.9.9"
)
conflicts=(
	"zlib-ng"
)
options=(
	"staticlibs"
)
source=(
	"git+${url}.git"
	"zlib-ng.conf"
)
b2sums=(
	"SKIP"
	"bf6eb01985db45c6b209a981aa5dbb97c9533fac960cd92ad9aee2d7926f0ec0e133f7df65901ced722fc51bdb362c6bfa3442c8d023db079b6636d109856071"
)

build()
{
	cd "zlib-ng" || exit
	./configure --prefix="/opt/zlib-ng" --zlib-compat
	make
}

check()
{
	cd "zlib-ng" || exit
	make test
}

package()
{
	install -D -m644 "zlib-ng.conf" "${pkgdir}/etc/ld.so.conf.d/zlib-ng.conf"

	cd "zlib-ng" || exit
	make install DESTDIR="${pkgdir}"

	install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
