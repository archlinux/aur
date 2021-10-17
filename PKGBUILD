# Maintainer: Michael Serajnik <m at mser dot at>
pkgname=vpn-whitelist-git
_pkgname=vpn-whitelist
pkgver=r47.bcb1b93
pkgrel=1
pkgdesc="Whitelist domains and addresses to bypass an active VPN connection"
arch=("any")
url="https://github.com/cryzed/${_pkgname}"
license=("AGPL3")
depends=("python" "python-psutil")
makedepends=("git")
optdepends=("networkmanager: support for automatic whitelisting of addresses"
            "ufw: support for whitelisting addresses in UFW")
backup=("etc/vpn-whitelist.conf")
source=("git+https://github.com/cryzed/${_pkgname}.git")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -D --mode 755 "${srcdir}/${_pkgname}/vpn-whitelist" --target-directory "${pkgdir}/usr/bin"
  install -D --mode 755 "${srcdir}/${_pkgname}/vpn-whitelist-dns-proxy" --target-directory "${pkgdir}/usr/bin"
  install -D --mode 644 "${srcdir}/${_pkgname}/vpn-whitelist.conf" --target-directory "${pkgdir}/etc"
  install -D --mode 755 "${srcdir}/${_pkgname}/vpn-whitelist.NetworkManager-dispatcher" --target-directory "${pkgdir}/etc/NetworkManager/dispatcher.d"
  install -D --mode 755 "${srcdir}/${_pkgname}/vpn-whitelist.service" --target-directory "${pkgdir}/etc/systemd/system"
}
