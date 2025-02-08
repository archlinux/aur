# Maintainer: Thomas Gassmann <thomas@gassmann.dev>

pkgname=steuern-lu-np-2023
pkgver=2023.1
pkgrel=3
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
  'SKIP'
  '43ef0bd8903205ac63b529d7bd73ac90b79fc59ed10f56e894ec570e0eb02b2a'
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
