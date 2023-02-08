# Maintainer: Jeremy Stucki <dev@jeremystucki.ch>
# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>
# Maintainer: soloturn@gmail.com

yyyy=2022
pkgname=easytax-ag-${yyyy}
pkgver=1.1
pkgrel=1
pkgdesc="Aargau tax declaration software."
arch=(any)
url="https://www.ag.ch/de/dfr/steuern/natuerliche_personen/steuererklaerung__easytax/steuererklaerung_easytax1.jsp"
license=('custom')
depends=("java-environment" "bash")
source=(
  "https://msg-easytax.ch/ag/${yyyy}/EasyTax${yyyy}AG_unix_$(echo ${pkgver} | sed 's/\./_/').tar.gz"
  "$pkgname.desktop"
)
sha256sums=(
  '0a6c7bcbc8179364da3b4b6772a17b7296b5687a1612e93501ccb3f7c4a99cd4'
  'c4ee6bbd08d5e6ead09ac11770b7fefe8df654dae6d8fd981a25a64c42761d6c'
)

package() {
  # package the software, the xdg desktop file so GUI finds it
  # and the link in bin so commandline finds it.
  mkdir -p "$pkgdir"/usr/lib
  mv "$srcdir"/EasyTax${yyyy}AG/ "$pkgdir"/usr/lib/$pkgname/

  mkdir -p "$pkgdir"/usr/share/applications
  cp *.desktop "$pkgdir"/usr/share/applications/

  mkdir -p "$pkgdir"/usr/bin
  binname=$(basename "$pkgdir"/usr/lib/$pkgname/EasyTax*)
  ln -sf /usr/lib/${pkgname}/$binname "$pkgdir"/usr/bin/$pkgname
}
