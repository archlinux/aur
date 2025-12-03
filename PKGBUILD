# Maintainer: SuicideCatt <random.cat.from.internet@gmail.com>

options=(!debug !strip)

pkgname=msdfgen
pkgver=1.13
pkgrel=2
pkgdesc="Multi-channel signed distance field generator binary and library"
url=https://github.com/Chlumsky/msdfgen
arch=(x86_64)
license=(MIT)
depends=(tinyxml2 libpng freetype2 zlib)
makedepends=(git cmake gcc make)
provides=(msdfgen=$pkgver)
conflicts=(msdfgen-git)

source=("${pkgname}-${pkgver}.tag.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build()
{
	cd "${pkgname}-${pkgver}"
	cmake -B build -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=Release \
		-DMSDFGEN_USE_SKIA=OFF -DMSDFGEN_USE_VCPKG=OFF \
		-DMSDFGEN_INSTALL=ON -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package()
{
	cd "${pkgname}-${pkgver}"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	DESTDIR="$pkgdir" cmake --install build
}
