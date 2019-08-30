# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=cawbird
pkgver=1.0
pkgrel=1
pkgdesc="Native Gtk+ Twitter Client"
arch=(i686 x86_64)
license=(GPL3)
url="https://ibboard.co.uk/cawbird/"
depends=(gtk3 sqlite3 gspell
         gst-plugins-good gst-plugins-bad gst-libav)
makedepends=(vala git meson)
source=("$pkgname-$pkgver.tar.gz::https://github.com/IBBoard/cawbird/archive/v${pkgver}.tar.gz")
sha256sums=('a6439d3bd9d3e4e72e02d434e1f4f2b0037e8417f242455830f05892efaa46ca')

build() {
  cd "$pkgname-$pkgver"
  meson _build --prefix=/usr -D VIDEO=yes -D SPELLCHECK=yes
  ninja -C _build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="${pkgdir}" ninja -C _build install
}
