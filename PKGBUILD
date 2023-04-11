# Maintainer: Edward Pacman <edward at edward-p.xyz>

_pkgname='broadcom-bt-firmware'
pkgname="$_pkgname-git"
pkgdesc="Broadcom bluetooth firmware."
pkgver=12.0.1.1105_p4.r0.ga0eb480
pkgrel=1
arch=('any')
license=('custom')
url="https://github.com/winterheart/broadcom-bt-firmware"

provides=(
  "$_pkgname"
  'bcm20702a1-firmware'
  'bcm20702b0-firmware'
  'bcm20703a1-firmware'
  'bcm43142a0-firmware'
  'bcm4335c0-firmware'
  'bcm4350c5-firmware'
  'bcm4356a2-firmware'
)
conflicts=(${provides[@]})

depends=()
makedepends=('git')

source=(
  "$_pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"

  #Install firmwares
  for i in brcm/*.hcd; do
    install -Dm644 "$i" "$pkgdir/usr/lib/firmware/$i"
  done

  #Install LICENSE
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE.MIT.txt"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE.broadcom_bcm20702"
}
