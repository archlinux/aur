# Maintainer: Carlo Teubner <carlo@cteubner.net>
pkgname=wtype
pkgver=0.1
pkgrel=1
pkgdesc="xdotool type for wayland"
arch=('x86_64')
url="https://github.com/atx/wtype"
license=('MIT')
depends=('wayland' 'libxkbcommon')
makedepends=('meson')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1544ecf0e516d10a7121160a1e3be746a932a6404452b3d65a56c8a7189e2cda')

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
