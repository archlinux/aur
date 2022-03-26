# Maintainer: Jeremy Stucki <dev@jeremystucki.ch>
# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>
# Maintainer: soloturn@gmail.com

yyyy=2021
pkgname=easytax-bl-${yyyy}
pkgver=1.1
pkgrel=1
pkgdesc="Baselland tax declaration software, kanton basel-landschaft, 2021."
arch=(any)
url="https://www.baselland.ch/politik-und-behorden/direktionen/finanz-und-kirchendirektion/steuerverwaltung/privatperson/easytax"
license=('custom')
depends=("java-runtime>=8" "bash")
source=(
  "https://msg-easytax.ch/bl/${yyyy}/EasyTax${yyyy}BL_unix_$(echo ${pkgver} | sed 's/\./_/').tar.gz"
  "$pkgname.desktop"
)
sha256sums=(
  '2bb4f867686b01b7c3a6e907d09ccaa3960754ae227610bc7b5c27b41680f454'
  'e410770a5608677f0f2e1a5e0a423da34101efda2a3310e74ea8372c31ff26f5'
)

package() {
  # package the software, the xdg desktop file so GUI finds it
  # and the link in bin so commandline finds it.
  mkdir -p "$pkgdir"/usr/lib
  mv "$srcdir"/EasyTax${yyyy}*/ "$pkgdir"/usr/lib/$pkgname/

  mkdir -p "$pkgdir"/usr/share/applications
  cp *.desktop "$pkgdir"/usr/share/applications/

  mkdir -p "$pkgdir"/usr/bin
  binname=$(basename "$pkgdir"/usr/lib/$pkgname/EasyTax*)
  ln -sf /usr/lib/${pkgname}/$binname "$pkgdir"/usr/bin/$pkgname
}
