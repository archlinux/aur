# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=kickpad
pkgver=1.5.0
pkgrel=1
pkgdesc='Kick drum audio sample generator'
arch=(x86_64)
url='https://github.com/xyproto/kickpad'
license=(MIT)
depends=(glfw sdl2 sdl2_mixer)
makedepends=(gendesk git go)
source=("git+$url#tag=v$pkgver") # tag: v1.5.0
b2sums=('92073afb2dbb9d5aa9cc39c668bd2727ea36f8f9e71d436b6f800c0cbdc348a961c4ea5507e0fa7fa7529c6f63004b02471c88f685036d6b25f737e50b490856')

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
