# Maintainer: Joe <joe@kitsunehosting.net>

pkgname=framework-webhid-udev
pkgver=1.0
pkgrel=1
pkgdesc="Udev rules to allow WebHID access to Framework Laptop 16 input modules"
arch=('any')
url="https://keyboard.frame.work/"
license=('MIT')
depends=('systemd') # Ofc
source=('framework-webhid.rules')
sha256sums=('SKIP')

package() {
  install -Dm644 framework-webhid.rules \
    "$pkgdir/etc/udev/rules.d/50-framework-webhid.rules"
}

post_install() {
  echo "Reloading udev rules..."
  udevadm control --reload-rules || true
  udevadm trigger || true
  echo
  echo "If you still can't open the device, reseat the module or reboot."
}

post_upgrade() {
  post_install
}
