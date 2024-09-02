# Maintainer:
# Contributor: Edward Pacman <edward at edward-p.xyz>

_pkgname='broadcom-bt-firmware'
pkgname="$_pkgname-git"
pkgver=12.0.1.1105_p4.r1.g3b7cff9
pkgrel=2
pkgdesc="Broadcom bluetooth firmware"
url="https://github.com/winterheart/broadcom-bt-firmware"
license=('LicenseRef-Broadcom')
arch=('any')

makedepends=('git')

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

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgsrc"

  for i in brcm/*.hcd; do
    install -Dm644 "$i" "$pkgdir/usr/lib/firmware/$i"
  done

  install -Dm644 "LICENSE.MIT.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  install -Dm644 "LICENSE.broadcom_bcm20702" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.broadcom_bcm20702"
}
