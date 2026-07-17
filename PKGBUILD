# Maintainer: kuchen <70746714+Kuucheen@users.noreply.github.com>
pkgname=pixelkit
pkgver=0.1.2
pkgrel=1
pkgdesc='Native Linux color picker and screen ruler'
arch=('x86_64' 'aarch64')
url='https://github.com/Kuucheen/PixelKit'
license=('MIT')
depends=('hicolor-icon-theme' 'libx11' 'libxcb' 'libxkbcommon' 'wayland' 'mesa' 'xdg-desktop-portal')
makedepends=('cargo')
options=('!debug')
optdepends=(
  'xdg-desktop-portal-gtk: portal backend for GTK desktops'
  'xdg-desktop-portal-kde: portal backend for KDE Plasma'
  'xdg-desktop-portal-gnome: portal backend for GNOME'
)
source=("${pkgname}-${pkgver}-vendor.tar.xz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-vendor.tar.xz")
sha256sums=('e01d07cc4043af4754c2bad0bf26405abfe10dd588029720d1ff3be28364b4da')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen --offline
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --all-targets --frozen --offline
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr CARGO='cargo --offline'
}
