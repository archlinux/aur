# Maintainer: Nathan Lowe <techwiz96@gmail.com>
pkgname=nexus-gamepad-uinput-git
_pkgver=1.0
pkgver=${_pkgver}.5c2087d
pkgrel=1
pkgdesc="uinput mappings for ASUS Nexus Player Gamepads"
arch=('i686' 'x86_64')
url="https://github.com/Phasip/nexus_gamepad_uinput"
license=('MIT')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
  printf "${_pkgver}.%s" $(git rev-parse --short HEAD)
}

build() {
  cd ${srcdir}/${pkgname}
  make
}

package() {
  cd ${srcdir}/${pkgname}

  install -Dm755 "${srcdir}/../ngpd" "$pkgdir/usr/bin/ngpd"
  install -Dm755 "nexus_gamepad_uinput" "$pkgdir/usr/bin/nexus_gamepad_uinput"

  install -Dm644 "${srcdir}/../99-nexus-gamepad-uinput.rules" "$pkgdir/etc/udev/rules.d/99-nexus-gamepad-uinput.rules"
  install -Dm644 "${srcdir}/../nexus_gamepad@.service" "$pkgdir/etc/systemd/system/nexus_gamepad@.service"
}
