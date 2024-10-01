# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=kickpad
pkgver=1.5.3
pkgrel=1
pkgdesc='Kick drum audio sample generator'
arch=(x86_64)
url='https://github.com/xyproto/kickpad'
license=(MIT)
depends=(glfw sdl2 sdl2_mixer)
makedepends=(gendesk git go)
source=("git+$url#tag=v$pkgver")
b2sums=('517e27e2c5194d8006b527a18f7d93c3ca5378638f2398ad05ad0843bdc49ec3200fe07bed0ac7d62f540bb6b3b73f199b2c32ee3e0e057ad98f3732fecf2429')

prepare() {
  gendesk -f -n --pkgdesc="$pkgdesc" --pkgname=$pkgname --categories 'AudioVideo;Audio'
}

build() {
  cd $pkgname
  go build -tags=enable_cimgui_sdl2 -mod=mod -v -trimpath -buildmode=pie -ldflags="-s -w -extldflags '$LDFLAGS'"
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" $pkgname/$pkgname
  install -Dm644 -t "$pkgdir/usr/share/applications" $pkgname.desktop
  install -Dm644 $pkgname/img/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname/LICENSE
}
