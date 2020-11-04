# Maintainer: David Anderson <dave@natulte.net>

pkgname="tailscale-bin"
_version="1.2.1"
pkgver="1.2.1"
pkgrel="1"
pkgdesc="A mesh VPN that makes it easy to connect your devices, wherever they are."
arch=("x86_64")
url="https://tailscale.com"
license=("MIT")
depends=("glibc")
provides=("tailscale")
conflicts=("tailscale")
backup=("etc/default/tailscaled")
source=("$pkgname-$pkgver.tgz::https://pkgs.tailscale.com/stable/tailscale_${_version}_amd64.tgz")
sha256sums=('8b5bcf7f5bcbf9fa1b36c5ed266b468d00ca732b87551ef8a6a2ae1bfebfc6e3')
install="tailscale.install"

package() {
    cd tailscale_${_version}_amd64
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/etc/default" "$pkgdir/usr/lib/systemd/system"
  install -m755 tailscale tailscaled "$pkgdir/usr/bin"
  install -m644 systemd/tailscaled.defaults "$pkgdir/etc/default/tailscaled"
  install -m644 systemd/tailscaled.service "$pkgdir/usr/lib/systemd/system"
}
