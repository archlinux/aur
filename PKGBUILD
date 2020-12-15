# Maintainer: David Anderson <dave@natulte.net>

pkgname="tailscale-bin"
_version="1.2.10"
pkgver="1.2.10"
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
sha256sums=('0eb1cbd98c787906ce68fdf91469a7add4836c0c6af89684948ca3a56c71fb81')
install="tailscale.install"

package() {
    cd tailscale_${_version}_amd64
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/etc/default" "$pkgdir/usr/lib/systemd/system"
  install -m755 tailscale tailscaled "$pkgdir/usr/bin"
  install -m644 systemd/tailscaled.defaults "$pkgdir/etc/default/tailscaled"
  install -m644 systemd/tailscaled.service "$pkgdir/usr/lib/systemd/system"
}
