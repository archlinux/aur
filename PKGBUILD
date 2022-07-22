# Maintainer: Eric Engestrom <arch.aur@engestrom.ch>

pkgname=dragonframe-bin
pkgver=5.0.8
pkgrel=1
pkgdesc="Industry standard stop motion animation software"
arch=('x86_64')
url=https://www.dragonframe.com/
license=('EULA')
provides=('dragonframe')
conflicts=('dragonframe')
source=("https://www.dragonframe.com/download/dragonframe${pkgver%%.*}_${pkgver}_amd64.deb")
sha256sums=('0db02a7a13830cb17c14731a60a027be06ad7f2780f2da26420b9e3f01cab8ae')
options=('!strip')
depends=('libudev0-shim')

package() {
  bsdtar xf "dragonframe${pkgver%%.*}_${pkgver}_amd64.deb"
  bsdtar xf data.tar.xz -C "$pkgdir"

  # Fix executable path
  sed "s, bin/, /opt/dragonframe${pkgver%%.*}/bin/," -i "$pkgdir"/opt/dragonframe${pkgver%%.*}/dragonframe${pkgver%%.*}

  # Placeholder file for the user's license
  install -dm 755 "$pkgdir"/etc/opt/dragonframe${pkgver%%.*}
  echo "# License File" > "$pkgdir"/etc/opt/dragonframe${pkgver%%.*}/license.properties
  chmod 666 "$pkgdir"/etc/opt/dragonframe${pkgver%%.*}/license.properties
}
