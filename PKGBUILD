# Maintainer: Thomas Gassmann <thomas@gassmann.dev>

pkgname=steuern-lu-np-2022
pkgver=2022.1
pkgrel=1
pkgdesc="Lucerne tax declaration software for natural persons 2022"
arch=(any)
url="https://steuern.lu.ch/steuererklaerung/steuererklaerung_natp/Installation"
license=('custom')
depends=("java-environment" "bash")
source=(
  "https://steuersoftware.lu.ch/steuern22/steuern.lu.2022nP.sh"
  "$pkgname.desktop"
)
sha256sums=(
  '00304a32ef9323397f9d6f19ef6f3368c15f4667d3867e213e574ba8a9c03ff0'
  '3da6addee7559206d9428d162a8faa14864cf252d1ca9287b4cae9c6e442f96f'
)

prepare() {
  chmod +x "$srcdir"/steuern.lu.2022nP.sh
	"$srcdir"/steuern.lu.2022nP.sh -q \
		-Dall=true \
		-V'addToPath$Integer'=1 \
		-dir "$srcdir/steuern-lu-np-2022"
}

package() {
  mkdir -p "$pkgdir"/opt/steuern-lu-np-2022
  cp -R "$srcdir"/steuern-lu-np-2022/* "$pkgdir"/opt/steuern-lu-np-2022
  install -Dm644 "$srcdir"/$pkgname.desktop \
    "$pkgdir"/usr/share/applications/$pkgname.desktop
}
