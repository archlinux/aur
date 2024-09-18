# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=kickpad
pkgver=1.2.3
pkgrel=1
pkgdesc='Kick drum audio sample generator'
arch=(x86_64)
url='https://github.com/xyproto/kickpad'
license=(MIT)
depends=(ffmpeg glfw)
makedepends=(gendesk git go)
source=("git+$url#commit=f5abc72491d811ba5edfd112f4c2d32d6c2da407") # tag: v1.2.3
b2sums=('6e296637152a62e8103d30e6677c2aa1e6cc4023a645f80f03fdda45f3404eabca9d012f8331d666ee5227fa789499bd91a62d07e8700ea5112c7de8b3e617d3')

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
