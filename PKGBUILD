# Maintainer: Carlo Teubner <carlo@cteubner.net>
pkgname=wtype
pkgver=0.2
pkgrel=1
pkgdesc="xdotool type for wayland"
arch=('x86_64')
url="https://github.com/atx/wtype"
license=('MIT')
depends=('wayland' 'libxkbcommon')
makedepends=('meson')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('14eef1c7a51c8c90ccf005443e2e52a164dbb49fabf75953ed1d021a1184acd6')

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
