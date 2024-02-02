# Maintainer: Thomas Gassmann <thomas@gassmann.dev>

pkgname=steuern-lu-np-2023
pkgver=2023.1
pkgrel=1
pkgdesc="Lucerne tax declaration software for natural persons 2023"
arch=(any)
url="https://steuern.lu.ch/steuererklaerung/steuererklaerung_natp/Installation"
license=('custom')
depends=("java-environment" "bash")
source=(
  "https://steuersoftware.lu.ch/steuern23/steuern.lu.2023nP.sh"
  "$pkgname.desktop"
)
sha256sums=(
  '5c1b5081555539e007866527d15a84df3a9888392eef8f584b999b1dfb3a8a5d'
  '65dd1434e4b2eac450521aca63701be706e21326cac34e0e4fafb3442c79f516'
)

prepare() {
  chmod +x "$srcdir"/steuern.lu.2023nP.sh
	"$srcdir"/steuern.lu.2023nP.sh -q \
		-Dall=true \
		-V'addToPath$Integer'=1 \
		-dir "$srcdir/steuern-lu-np-2023"
}

package() {
  mkdir -p "$pkgdir"/opt/steuern-lu-np-2023
  cp -R "$srcdir"/steuern-lu-np-2023/* "$pkgdir"/opt/steuern-lu-np-2023
  install -Dm644 "$srcdir"/$pkgname.desktop \
    "$pkgdir"/usr/share/applications/$pkgname.desktop
}
