# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=palgen
pkgver=1.6.0
pkgrel=1
pkgdesc='Extract palettes and convert PNG files from True color to indexed'
arch=(x86_64)
url='https://github.com/xyproto/palgen'
license=(BSD)
makedepends=(git go)
source=("git+$url#tag=v$pkgver")
b2sums=('27b01e63f721f3107d0408b364bb91018cbbffe7cf8dd05e3f03dd866f3b294317df78838f1554fc7cb1d7432373bb1ea570f9402ddc1bb27f2f077ca8481827')

build() {
  export BUILDFLAGS='-mod=vendor -buildmode=pie -trimpath -ldflags="-s -w"'
  make -C $pkgname
}

package() {
  DESTDIR="$pkgdir" PREFIX="/usr" make -C $pkgname install
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
