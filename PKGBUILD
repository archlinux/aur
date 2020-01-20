# Maintainer: David Anderson <dave@natulte.net>

pkgname="tailscale"
_version="0.94-236"
pkgver="0.94_236"
pkgrel="1"
pkgdesc="A mesh VPN that makes it easy to connect your devices, wherever they are."
arch=("x86_64")
url="https://tailscale.com"
license=("custom")
depends=("glibc")
backup=("etc/default/tailscale-relay" "etc/tailscale/acl.json")
makedepends=("rpmextract")
source=("$pkgname-$pkgver.rpm::https://tailscale.com/files/dist/tailscale-relay-$_version.$arch.rpm")
sha256sums=('b8e7505debba715f1a7c444715fbbbca5a6e3dd6515f35756006fa0daab3b9ea')
noextract=("$pkgname-$pkgver.rpm")

prepare() {
  mkdir -p "$pkgname-$pkgver"
  (cd "$pkgname-$pkgver" && rpmextract.sh "../$pkgname-$pkgver.rpm")
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr"
  cp -r etc "$pkgdir"
  cp -r lib "$pkgdir/usr"
  cp -r usr/sbin "$pkgdir/usr/bin"
}
