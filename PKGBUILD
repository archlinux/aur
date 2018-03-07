# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=subgraph-firewall
pkgver=0.0.11
pkgrel=2
pkgdesc="Subgraph Application Firewall"
arch=('any')
url="https://github.com/subgraph/fw-daemon"
license=('BSD3')
depends=('subgraph-oz')
source=("subgraph-firewall-${pkgver}.tar.gz::https://github.com/subgraph/fw-daemon/archive/v${pkgver}.tar.gz"
	"https://raw.githubusercontent.com/subgraph/fw-daemon/debian/debian/fw-daemon.service")
sha512sums=("1c1b164fdd3784f8458666754d03ee43ea06843fdf6b3869683a552b3bcf2ca4c0152a8cacfde7e9d9590d3e669942ae874fffdd25d552c7f717b5e7fbfa01c9"
	    "4241dd6aaca8318c77b88d52449c8769d45e553ebc40d2df8500bf18e17a9fee925184b0b08b24544812141beca05deeed55c29dfb45678648555c0f3be52965")

build() {
  cd "${srcdir}/fw-daemon-${pkgver}"
  go build
}

package() {
  cd "${srcdir}/fw-daemon-${pkgver}"
  install -Dm755 "fw-daemon-${pkgver}" "${pkgdir}/usr/bin/fw-daemon"
  cp -r sources/etc "${pkgdir}/"

  install -Dm644 "${srcdir}/fw-daemon.service" "${pkgdir}/usr/lib/systemd/system/fw-daemon.service"
  install -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "sources/usr/share/applications/subgraph-firewall.desktop" "${pkgdir}/usr/share/applications/subgraph-firewall.desktop"
}
