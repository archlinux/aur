# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=overplay-vpn
pkgver=1.0
pkgrel=2
epoch=
pkgdesc="Certificate and connection files for connecting to Overplay VPN servers using OpenVPN"
arch=('any')
url="https://www.overplay.net/setup.php"
license=('custom')
groups=()
depends=('openvpn')
makedepends=('coreutils')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=('https://patch.oppatch.com/OverplayCert.crt' 'https://patch.oppatch.com/connections.zip' 'LICENSE')
noextract=()
md5sums=('edcf0a2cd555712d68384a3e3b9958e8' '4968f6b9b737c59ce70b38f6ef7cec33' '8e6266c7807425a36a4d417a88a3cd53')

build() {
  cd "${srcdir}"
  for i in *.conf
  do
    sed -e 's/OverplayCert.crt/\/etc\/openvpn\/OverplayCert.crt/g' -i "${i}"
  done
}

package() {
  cd "$srcdir/"

  install -D -m 666 OverplayCert.crt ${pkgdir}/etc/openvpn/OverplayCert.crt
  for i in *.conf
  do
    install -D -m 666 "${i}" "${pkgdir}/etc/openvpn/${i}"
  done
  install -D -m 666 LICENSE ${pkgdir}/usr/share/licenses/overplay-vpn/LICENSE
}

# vim:set ts=2 sw=2 et:
