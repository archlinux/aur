# Maintainer: Jeremy Stucki <dev@jeremystucki.ch>
# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>
# Maintainer: soloturn@gmail.com

_yyyy=2024
pkgname=easytax-ag-${_yyyy}
pkgver=1.2
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
  '36d50f70ef93a3846fd054f1605c79f6e333140efbe41a07254a339a9e2cd5e0'
  '253d315b20371cd9add777dc990f96545c60d5d07a3f34cd33720d5148e82486'
  '585c8b0067a6dd0f00ce1cc98156c4915c40095f3a042050348796859a8306d4'
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
