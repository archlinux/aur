# Maintainer: SuicideCatt <fr7g31@gmail.com>

pkgname=msdfgen-git2
pkgver=1.11.r2.g2357140
pkgrel=1
pkgdesc="Multi-channel signed distance field generator"
url=https://github.com/Chlumsky/msdfgen
arch=(x86_64)
license=(MIT)
depends=(tinyxml2 libpng freetype2 zlib)
makedepends=(git cmake ninja)
provides=(msdfgen=$pkgver)
conflicts=(msdfgen)

source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver()
{
	cd $pkgname/
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
	cd $pkgname/
	cmake -B build -GNinja -DCMAKE_BUILD_TYPE=Release \
	-DMSDFGEN_USE_SKIA=OFF -DMSDFGEN_USE_VCPKG=OFF \
	-DMSDFGEN_INSTALL=ON -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package()
{
	cd $pkgname/
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cmake --install build --prefix $pkgdir/usr
}
