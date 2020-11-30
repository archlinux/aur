# Maintainer: Eric Engestrom <arch.aur@engestrom.ch>

pkgname=dragonframe-bin
pkgver=4.2.2
pkgrel=1
pkgdesc="Industry standard stop motion animation software"
arch=('x86_64')
url=https://www.dragonframe.com/
license=('EULA')
provides=('dragonframe')
conflicts=('dragonframe')
source=("https://www.dragonframe.com/download/dragonframe4_${pkgver}_amd64.deb")
sha256sums=('b594ed0a08900c08c759efe10244be9b3ec72ec136035a34bab6e31fbd89700c')
options=('!strip')
depends=('libudev0-shim')

package() {
  bsdtar xf "dragonframe4_${pkgver}_amd64.deb"
  bsdtar xf data.tar.xz -C "$pkgdir"

  # Fix executable path
  sed 's, bin/, /opt/dragonframe4/bin/,' -i "$pkgdir"/opt/dragonframe4/dragonframe4

  # Placeholder file for the user's license
  install -dm 755 "$pkgdir"/etc/opt/dragonframe4
  echo "# License File" > "$pkgdir"/etc/opt/dragonframe4/license.properties
  chmod 666 "$pkgdir"/etc/opt/dragonframe4/license.properties
}
