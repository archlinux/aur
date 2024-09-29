# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=kickpad
pkgver=1.5.1
pkgrel=1
pkgdesc='Kick drum audio sample generator'
arch=(x86_64)
url='https://github.com/xyproto/kickpad'
license=(MIT)
depends=(glfw sdl2 sdl2_mixer)
makedepends=(gendesk git go)
source=("git+$url#tag=v$pkgver")
b2sums=('5078b979a78ebb39f2ee7faad11cc70081ab5104308151842dfa5a4ebaba6a6c31992519a9869f835c14b8ffd376453a20bf1c8ee2c061114d9af2ff13a1279a')

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
