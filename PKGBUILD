# Maintainer: Thomas Gassmann <thomas@gassmann.dev>

pkgname=steuern-lu-np-2024
pkgver=2024.1
pkgrel=2
pkgdesc="Lucerne tax declaration software for natural persons 2024"
arch=(any)
url="https://steuern.lu.ch/steuererklaerung/steuererklaerung_natp/Installation"
license=('custom')
depends=("java-environment" "bash")
source=(
  "https://steuersoftware.lu.ch/steuern24/steuern.lu.2024nP.sh"
  "$pkgname.desktop"
)
sha256sums=(
  'SKIP'
  '99cd2c2f85bbf69eaecce06a943cb7b3ffb5dd0a23f2ba34f73ae5773fcdd425'
)

prepare() {
  chmod +x "$srcdir"/steuern.lu.2024nP.sh
	"$srcdir"/steuern.lu.2024nP.sh -q \
		-Dall=true \
		-V'addToPath$Integer'=1 \
		-dir "$srcdir/steuern-lu-np-2024"
}

package() {
  mkdir -p "$pkgdir"/opt/steuern-lu-np-2024
  cp -R "$srcdir"/steuern-lu-np-2024/* "$pkgdir"/opt/steuern-lu-np-2024
  install -Dm644 "$srcdir"/$pkgname.desktop \
    "$pkgdir"/usr/share/applications/$pkgname.desktop
}
