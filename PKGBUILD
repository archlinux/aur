# Maintainer: Alistair Barrow <a.[SURNAME].a@gmail.com>

pkgname=imlib2-jxl
pkgver=0.2.0
pkgrel=1
pkgdesc="JPEG XL loader for imlib2"
arch=(x86_64)
url="https://github.com/alistair7/$pkgname"
license=(BSD)
depends=(imlib2 libjxl lcms2)
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/alistair7/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(b49ded4e9251569cfa0245a3075796924656f565e681c60a02c8ec7e16fd9a71)

build() {
	cd "$pkgname-$pkgver"
	make RELEASE_CFLAGS="$CFLAGS"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 jxl.so "$pkgdir$(pkg-config imlib2 --variable=libdir)/imlib2/loaders/jxl.so"
	install -Dm644 LICENSE-BSD-ab -t "$pkgdir/usr/share/licenses/$pkgname"
}
