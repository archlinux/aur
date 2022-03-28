# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=palgen
pkgver=1.0.1
pkgrel=1
pkgdesc='Extract palettes and convert PNG files from True color to indexed'
arch=(x86_64)
url='https://github.com/xyproto/palgen'
license=(BSD)
makedepends=(git go upx)
source=("git+$url#commit=0c51a212e6619ceb6a59a4511c3f772538cdcaf4") # tag: v1.0.1
b2sums=('SKIP')

build() {
  make -C $pkgname
}

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
  find "$pkgdir/usr/bin/" -executable -type f -exec upx -q --no-progress {} >/dev/null \;
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
