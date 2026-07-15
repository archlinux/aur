pkgname=networkmanager-airvpn-core
_pkgname=networkmanager-airvpn
pkgver=0.1.0
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
sha256sums=('8f0c6b5dc0811e1248be40fec34d0b530582cbd2d00cd801e378764ccd34086c')

build() {
  arch-meson "$_pkgname-$pkgver" build -Dgnome=false -Dgtk4=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
