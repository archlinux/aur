# Maintainer: Jeremy Stucki <dev@jeremystucki.ch>
# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>
# Maintainer: soloturn@gmail.com

yyyy=2022
pkgname=easytax-ag-${yyyy}
pkgver=1.0
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
  '1dce65837fe258fda921035f11e724d6d19680c6ca6cab94e0551a8dd406be18'
  '1e2cb8dcefd5c891339d064997d2ffd4370bee8def3dee37b962e8e6b487f342'
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
