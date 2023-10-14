# Maintainer: Maki <mxmcube@gmail.com>

pkgname=msdfgen-git
pkgdesc="Multi-channel signed distance field generator"
pkgver=1.10.r14.gbd5f145
pkgrel=1
arch=(x86_64)
url=https://github.com/Chlumsky/msdfgen
license=(MIT)
depends=(tinyxml2 libpng freetype2 zlib)
makedepends=(git cmake ninja)
optdepends=()
provides=(msdfgen=$pkgver)
conflicts=(msdfgen)
source=($pkgname::git+https://github.com/Chlumsky/msdfgen.git)
sha256sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $pkgname/
    cmake -B build -GNinja \
	-DCMAKE_BUILD_TYPE=Release \
	-DMSDFGEN_USE_SKIA=OFF \
	-DMSDFGEN_USE_VCPKG=OFF
    cmake --build build
}

package() {
	install -Dm755 "$srcdir/$pkgname/build/msdfgen" "$pkgdir/usr/bin/msdfgen"
	install -Dm644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}