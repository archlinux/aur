# Maintainer: kuchen <70746714+Kuucheen@users.noreply.github.com>
pkgname=pixelkit
pkgver=0.2.0
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
sha256sums=('c0c5892f47a90bfc8f09a794f4fb9e6eba4a8754cb99e47b64a6fb3b24261952')

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
