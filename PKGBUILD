# Maintainer: Carlo Teubner <carlo@cteubner.net>
pkgname=wtype
pkgver=0.3
pkgrel=1
pkgdesc="xdotool type for wayland"
arch=('x86_64')
url="https://github.com/atx/wtype"
license=('MIT')
depends=('wayland' 'libxkbcommon')
makedepends=('meson')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('35615e61e57576a240d10308f9101ceb2ec7b3554fac60119b1416b84c1694b2')

build() {
  cd "$pkgname-$pkgver"
  meson setup --prefix=/usr --buildtype=plain build/
  meson compile -C build/
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  DESTDIR="$pkgdir/" meson install -C build/
}

# vim:set ts=2 sw=2 et:
