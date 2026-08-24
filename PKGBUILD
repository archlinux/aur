# Maintainer: kuchen <70746714+Kuucheen@users.noreply.github.com>
pkgname=pixelkit
pkgver=0.4.2
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
sha256sums=('db05cf3441cd0392777727a2ae372de6e07001ac1445d1b7d1dd1d8642dfbff3')

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
