# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=kickpad
pkgver=1.2.3
pkgrel=2
pkgdesc='Kick drum audio sample generator'
arch=(x86_64)
url='https://github.com/xyproto/kickpad'
license=(MIT)
depends=(ffmpeg glfw)
makedepends=(gendesk git go)
source=("git+$url#commit=f5abc72491d811ba5edfd112f4c2d32d6c2da407") # tag: v1.2.3
b2sums=('a2c05f4e6655fb3a3cf694f0c381da73d6e2748c3516c721444955a104a3696df41e857281438e0d7b85dfcf2d119f929f6a1e105d14bdb6555ea3d4b0cefc14')

prepare() {
  gendesk -f -n --pkgdesc="$pkgdesc" --pkgname=$pkgname --categories 'AudioVideo;Audio'
}

build() {
  cd $pkgname
  go build -tags exclude_cimgui_sdl -v -trimpath -buildmode=pie -ldflags="-s -w -extldflags '$LDFLAGS'"
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" $pkgname/$pkgname
  install -Dm644 -t "$pkgdir/usr/share/applications" $pkgname.desktop
  install -Dm644 $pkgname/img/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname/LICENSE
}
