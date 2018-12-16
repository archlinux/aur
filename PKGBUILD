pkgname=protonvpn-cli-git
pkgver=r158.9072bab
pkgrel=2
pkgdesc="ProtonVPN CLI tool for protonvpn.com"
arch=("any")
url="https://github.com/ProtonVPN/protonvpn-cli"
license=("MIT")
provides=("protonvpn-cli")
conflicts=("protonvpn-cli")
depends=("openvpn" "python" "dialog" "wget" "procps-ng" "openvpn-update-systemd-resolved")
makedepends=("git")
source=("git+https://github.com/ProtonVPN/protonvpn-cli.git")
sha256sums=("SKIP")

pkgver() {
  cd protonvpn-cli
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${srcdir}/protonvpn-cli/protonvpn-cli.sh" "${pkgdir}/usr/bin/protonvpn-cli"
  ln -s /usr/bin/protonvpn-cli "${pkgdir}/usr/bin/pvpn"
  
  install -dm755 "${pkgdir}/etc/openvpn"
  ln -s /etc/openvpn/scripts/update-systemd-resolved "${pkgdir}/etc/openvpn/update-resolv-conf"
  
  install -Dm644 "${srcdir}/protonvpn-cli/license.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
