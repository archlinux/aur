# Maintainer: Jeremy Stucki <dev@jeremystucki.ch>
# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>
# Maintainer: soloturn@gmail.com

_yyyy=2023
pkgname=easytax-ag-${_yyyy}
pkgver=1.0
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
  '5540c7464bc716c76f62765e331bd9faedca258e0d9fbec8723619be2300ccdd'
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
