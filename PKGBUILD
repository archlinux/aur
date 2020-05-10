# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname="zlib-ng-git"
pkgver=2
pkgrel=1
epoch=3
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
	"zlib-ng"
)
conflicts=(
	"zlib"
	"zlib-ng"
)
options=(
	"staticlibs"
)
source=(
	"git+${url}.git"
)
b2sums=(
	"SKIP"
)

build()
{
	cd "zlib-ng" || exit
	./configure --prefix="/usr" --zlib-compat
	make
}

check()
{
	cd "zlib-ng" || exit
	make test
}

package()
{
	cd "zlib-ng" || exit
	make install DESTDIR="${pkgdir}"

	install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
