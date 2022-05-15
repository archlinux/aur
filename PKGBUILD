# Maintainer: Jeremy Stucki <dev@jeremystucki.ch>
# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>
# Maintainer: soloturn@gmail.com

yyyy=2021
pkgname=easytax-ag-${yyyy}
pkgver=1.2
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
  'bc191f913f74f6649007688791b714957faade8c97bbcc31b6075ddeb54ed7f9'
  '59e9781415d7e6cd07b249002fd8737c545f5bdbc764fa228e1a0cfc9a56d0f4'
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
