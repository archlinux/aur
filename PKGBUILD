pkgname=networkmanager-airvpn-core
_pkgname=networkmanager-airvpn
pkgver=0.2.1
pkgrel=1
pkgdesc="NetworkManager VPN plugin for AirVPN (OpenVPN, nmcli only, no GNOME editor)"
arch=('x86_64')
url="https://github.com/LiteApplication/networkmanager-airvpn"
license=('GPL-2.0-or-later')
depends=(
  'networkmanager'
  'openvpn'
  'curl'
  'glib2'
  'json-glib'
)
makedepends=('meson' 'ninja')
provides=('networkmanager-airvpn')
conflicts=('networkmanager-airvpn')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('12f6ee5ae655a173ca194a057b8f0e1c9b72165cf8a0caba1e143c98bb2139f3')

build() {
  arch-meson "$_pkgname-$pkgver" build -Dgnome=false -Dgtk4=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
