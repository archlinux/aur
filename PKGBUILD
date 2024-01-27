# Maintainer: Jeremy Stucki <dev@jeremystucki.ch>
# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>
# Maintainer: soloturn@gmail.com

_yyyy=2022
pkgname=easytax-ag-${_yyyy}
pkgver=1.3
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
  '69a3886f12ee445d7e71f3c47b08cce8cf871981ff786453cf6331b34759b5d4'
  '253d315b20371cd9add777dc990f96545c60d5d07a3f34cd33720d5148e82486'
  'f666973e4142a2be29f19e206027aa89e7e7816021dbcff5f4df022cf6e11bb4'
)

package() {
  # package the software, the xdg desktop file so GUI finds it
  # and the link in bin so commandline finds it.
  mkdir -p "$pkgdir"/usr/lib
  mv "$srcdir"/EasyTax${_yyyy}AG/ "$pkgdir"/usr/lib/$pkgname/

  mkdir -p "$pkgdir"/usr/share/applications
  cp *.desktop "$pkgdir"/usr/share/applications/

  mkdir -p "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
  cp Wappen_Aargau.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/

  mkdir -p "$pkgdir"/usr/bin
  binname=$(basename "$pkgdir"/usr/lib/$pkgname/EasyTax*)
  ln -sf /usr/lib/${pkgname}/$binname "$pkgdir"/usr/bin/$pkgname
}
