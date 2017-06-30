# Maintainer: KopfKrieg <archlinux [at] absolem [dot] cc>

pkgname=suspend2hibernation
pkgver=0.1
pkgrel=2
pkgdesc='Enables delayed hibernation. After 20 minutes of sleep, your device automatically wakes up and enters hibernation to prevent too much battery drain through extended sleep state.'
url="https://wiki.archlinux.org/index.php/Power_management#Delayed_hibernation_service_file"
arch=('any')
depends=('systemd')
install="${pkgname}.install"
source=('suspend2hibernation.install'
        'suspend2hibernation.service')
sha1sums=('2d199f65a82122e3e4fedf593f81ff2c71f47a12'
          'd898f0c07e0f8f472e82f7d6fda34da8fec38b3a')

package() {
  mkdir -p "${pkgdir}/etc/systemd/system"

  cp "${srcdir}/suspend2hibernation.service" "${pkgdir}/etc/systemd/system/suspend2hibernation.service"
  cp "/lib/systemd/system/suspend.target"    "${pkgdir}/etc/systemd/system/suspend.target"

  echo "Requires=suspend2hibernation.service" >> "${pkgdir}/etc/systemd/system/suspend.target"

  chmod 0644 "${pkgdir}/etc/systemd/system/suspend2hibernation.service"
  chmod 0644 "${pkgdir}/etc/systemd/system/suspend.target"

  chown root:root "${pkgdir}/etc/systemd/system/suspend2hibernation.service"
  chown root:root "${pkgdir}/etc/systemd/system/suspend.target"
}
