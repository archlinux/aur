# Maintainer: Guillaume Donval <(firstname)(lastname)(at)firemail(dot)cc>
# Contributor: Quentin Vallin <(firstname)(lastname)(at)XXX(dot)tld>
pkgname="vpn-minute"
pkgver="0.1.0"
pkgrel=1
pkgdesc="On-demand/disposable VPN in a minute"
arch=("any")
url="https://gitlab.com/gui-don/vpn-minute/-/wikis/home"
license=("GPL3")
depends=("terraform>=0.12.25", "ldns>=1.7", "wireguard-tools>=1", "jq>=1", "sudo")
optdepends=("openssh: to SSH to the VPN")
provides=("vpnm")
source=("https://gitlab.com/gui-don/$pkgname/-/archive/$pkgver/vpn-minute-$pkgver.tar.gz")
b2sums=('093e0cbe1a90e9e7b0e5a308aa57f1c2348bd00e77cc8ce67a7ce2b00a6281005268fb07e312514f22fc09983b9b4c54329e0d700b521cbfb0333b2a11ecc9f1')

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  
  install -Dm755 main.sh "$pkgdir/usr/bin/vpnm"
  
  find terraform -type d -exec install -d "$pkgdir/usr/share/$pkgname/{}" \;
  find terraform -type f -iname "*.tmpl" -exec install -Dm444 "{}" "$pkgdir/usr/share/$pkgname/{}" \;
  find terraform -type f -iname "*.tf" -exec install -Dm444 "{}" "$pkgdir/usr/share/$pkgname/{}" \;
}

