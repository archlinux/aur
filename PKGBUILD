# Maintainer: graysky <graysky AT archlinux DOT us>
# vim:set ts=2 sw=2 et:

pkgname=lirc-user-service
pkgver=1.0
pkgrel=1
pkgdesc="Systemd service to run lirc as an unprivileged user for better security"
arch=(any)
url="https://www.lirc.org/html/configuration-guide.html"
license=(MIT)
depends=(lirc systemd)
source=(sysusers.conf tmpfiles.conf 60-lirc.rules override.conf)
md5sums=('d16f6232bcd98d104f1e0029761e7bf8'
         '818c7fa6b32ab3edb56ef643450116f2'
         'cbed0097426c746550c687ae3d0310ec'
         '4ffdd09910fc33314fbd1e3e6ff48fd6')

package() {
  install -Dm644 override.conf "$pkgdir/etc/systemd/system/lircd.service.d/override.conf"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm644 60-lirc.rules "$pkgdir/etc/udev/rules.d/60-lirc.rules"
}

