# Maintainer: André Herbst <moormaster@gmx.net>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Hojjat Ali Mohammadi <safeith@gmail.com>

pkgname=cyberghostvpn
pkgver=1.5.0
pkgrel=1
pkgdesc="CyberGhost VPN"
url="https://www.cyberghostvpn.com"
arch=(any)
license=(custom:cyberghostvpn)
depends=(
  bash
  curl
  openvpn
  wireguard-tools
  resolvconf
)
makedepends=(
  ca-certificates
  openssl
  zip
)

_variant=ubuntu-22.04
source=(	"https://download.cyberghostvpn.com/linux/cyberghostvpn-${_variant}-${pkgver}.zip"
		"http://crt.sectigo.com/SectigoRSAOrganizationValidationSecureServerCA.crt")
sha256sums=(	'c7cfd8e685f497ecc957636913bc32f8fa55b6ac0bbf19b2a4ebe64d188d03a6'
		'72a34ac2b424aed3f6b0b04755b88cc027dccc806fddb22b4cd7c47773973ec0')

_archive="${pkgname}-${_variant}-${pkgver}"

package() {
  _installdir=usr/local/cyberghost

  cd "$_archive"

  install -Dm 755 cyberghost/cyberghostvpn "$pkgdir/${_installdir}/cyberghostvpn"
  install -Dm 755 cyberghost/update-systemd-resolved "$pkgdir/${_installdir}/update-systemd-resolved"

  install -Dm 644 cyberghost/openvpn/ca.crt "$pkgdir/${_installdir}/openvpn/ca.crt"
  install -Dm 644 cyberghost/openvpn/client.crt "$pkgdir/${_installdir}/openvpn/client.crt"
  install -Dm 644 cyberghost/openvpn/client.key "$pkgdir/${_installdir}/openvpn/client.key"

  install -Dm 644 cyberghost/wireguard/ca.crt "$pkgdir/${_installdir}/wireguard/ca.crt"

  install -dm 755 $pkgdir/usr/bin
  ln -s /${_installdir}/cyberghostvpn $pkgdir/usr/bin/cyberghostvpn
  ln -s /${_installdir}/update-systemd-resolved $pkgdir/usr/bin/update-systemd-resolved
}
