# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=monitor
pkgver=3.3.1
pkgrel=2
pkgdesc='Utilities for handling monitors, resolutions, wallpapers and timed wallpapers'
arch=(x86_64)
url='https://github.com/xyproto/monitor'
license=(MIT)
depends=(wayland libx11)
makedepends=(git go libxcursor libxmu xbitmaps xorgproto)
source=("git+$url#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  sed -i 's/go build/go build -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-extldflags ${LDFLAGS}"/g' $pkgname/Makefile
}

build() {
  make -C $pkgname
}

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
