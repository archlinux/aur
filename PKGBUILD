# Maintainer: Carlo Teubner <carlo@cteubner.net>
pkgname=wtype-git
pkgver=0.3.r2.gfb8cb52
pkgrel=1
pkgdesc="xdotool type for wayland"
arch=('x86_64')
url="https://github.com/atx/wtype"
license=('MIT')
depends=('wayland' 'libxkbcommon')
provides=('wtype')
conflicts=('wtype')
makedepends=('git' 'meson' 'jq')
source=("git+https://github.com/atx/wtype")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags --match 'v*' | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  meson setup --prefix=/usr --buildtype=plain build/
  meson compile -C build/
}

package() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  DESTDIR="$pkgdir/" meson install -C build/
}

# vim:set ts=2 sw=2 et:
