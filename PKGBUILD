
# Maintainer: G. W. Sherman <gwsherman (at) proton.me>
pkgname=zxing-cpp-tools
pkgver=2.2.1
pkgrel=1
pkgdesc="Tools from the repo examples of ZXing-C++ (zxing-cpp)"
arch=('x86_64')
url="https://github.com/zxing-cpp/zxing-cpp"
options=()
license=('Apache-2.0')
depends=('zxing-cpp')
makedepends=('git' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(SKIP)

build()
{
	cmake -S "zxing-cpp-$pkgver" -B "zxing-cpp-$pkgver.release" -DCMAKE_BUILD_TYPE=Release
	cmake --build "zxing-cpp-$pkgver.release" -j8 --config Release
}

package()
{
	cd "$srcdir/zxing-cpp-$pkgver.release/example/"
	install -D -t "$pkgdir/usr/bin" ZXing{Read,Writ}er
}
