# Maintainer: KopfKrieg <archlinux [at] absolem [dot] cc>

pkgname=suspend2hibernation
pkgver=0.1
pkgrel=1
pkgdesc='Enables delayed hibernation. After 20 minutes of sleep, your device automatically wakes up and enters hibernation to prevent too much battery drain through extended sleep state.'
arch=('any')
depends=('systemd')
source=('suspend2hibernation.install'
        'suspend2hibernation.service')
sha1sums=('88fcb3252d36e754b1fc3c03fb793c223ccdcfd8'
          '04bba93122b2ca2c3a3100333cf1b7d6c24bca01')

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
