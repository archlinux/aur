# Maintainer: Alistair Barrow <a.[SURNAME].a@gmail.com>

pkgname=imlib2-jxl
pkgver=0.1.1
pkgrel=1
pkgdesc="JPEG XL loader for imlib2"
arch=(x86_64)
url="https://github.com/alistair7/$pkgname"
license=(BSD)
depends=(imlib2 libjxl lcms2)
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/alistair7/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(25d220e4638948174d5e76c66e2f0441ee41e0758fa63f065cdfd51bb76c1465)

build() {
	cd "$pkgname-$pkgver"
	make RELEASE_CFLAGS="$CFLAGS"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 jxl.so "$pkgdir$(pkg-config imlib2 --variable=libdir)/imlib2/loaders/jxl.so"
	install -Dm644 LICENSE-BSD-{ab,dh} -t "$pkgdir/usr/share/licenses/$pkgname"
}
