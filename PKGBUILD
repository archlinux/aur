# Maintainer: Jeremy Stucki <dev@jeremystucki.ch>
# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>
# Maintainer: soloturn@gmail.com

_yyyy=2023
pkgname=easytax-ag-${_yyyy}
pkgver=1.4
pkgrel=1
pkgdesc="Aargau tax declaration software."
arch=(any)
url="https://www.ag.ch/de/dfr/steuern/natuerliche_personen/steuererklaerung__easytax/steuererklaerung_easytax1.jsp"
license=('custom')
depends=("java-environment")
source=(
  "https://msg-easytax.ch/ag/${_yyyy}/EasyTax${_yyyy}AG_unix_$(echo ${pkgver} | sed 's/\./_/').tar.gz"
  "https://upload.wikimedia.org/wikipedia/commons/d/d9/Wappen_Aargau.svg"
  "$pkgname.desktop"
)
sha256sums=(
  'fcafdc981314c5c0915323a8dd26657f5b2dea6a8d2146d23a03286224dcc9aa'
  '253d315b20371cd9add777dc990f96545c60d5d07a3f34cd33720d5148e82486'
  'ac9162d4b0e05894401552f0e8ff5783986c8a41e7607b9cf23ddfa31ce399c5'
)

package() {
  # package the software, the xdg desktop file so GUI finds it
  # and the link in bin so commandline finds it.
  mkdir -p "$pkgdir"/usr/lib
  mv "$srcdir"/EasyTax${_yyyy}AG/ "$pkgdir"/usr/lib/$pkgname/

  mkdir -p "$pkgdir"/usr/share/applications
  cp *.desktop "$pkgdir"/usr/share/applications/

  mkdir -p "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
  cp Wappen_Aargau.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/Wappen_Aargau-${_yyyy}.svg

  mkdir -p "$pkgdir"/usr/bin
  binname=$(basename "$pkgdir"/usr/lib/$pkgname/EasyTax*)
  ln -sf /usr/lib/${pkgname}/$binname "$pkgdir"/usr/bin/$pkgname
}
