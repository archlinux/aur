# Maintainer: Eric Engestrom <arch.aur@engestrom.ch>

pkgname=dragonframe-bin
pkgver=4.2.4
pkgrel=1
pkgdesc="Industry standard stop motion animation software"
arch=('x86_64')
url=https://www.dragonframe.com/
license=('EULA')
provides=('dragonframe')
conflicts=('dragonframe')
source=("https://www.dragonframe.com/download/dragonframe4_${pkgver}_amd64.deb")
sha256sums=('773978046836a59ebce33609638334afae63c000b2dd782ea83e78560a740a16')
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
