# Maintainer: Paul Gideon Dann <pdgiddie_at_gmail.com>

pkgname=checksum-block-device
pkgver=1.0.0
pkgrel=1
pkgdesc="Watch for changes in block devices by checksumming on boot/resume and shutdown/sleep"
license=('BSD')
arch=('any')
url="https://github.com/giddie/checksum-block-device"
backup=('etc/profile.d/block-device-checksum-report.sh')
source=(https://github.com/giddie/checksum-block-device/archive/${pkgver}.tar.gz
        profile.d-hook.sh)
md5sums=('ef140ca6a6c01e463dc68fbe71f57d0b'
         '3bd3a08e7c9fc9dd005520301a0da5de')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  install -D -m 644 checksum-block-device@.service ${pkgdir}/usr/lib/systemd/system/checksum-block-device@.service
  install -D -m 644 checksum-block-device-on-sleep@.service ${pkgdir}/usr/lib/systemd/system/checksum-block-device-on-sleep@.service

  install -D -m 755 block-device-checksum-report ${pkgdir}/usr/bin/block-device-checksum-report
  install -D -m 755 ${srcdir}/profile.d-hook.sh ${pkgdir}/etc/profile.d/block-device-checksum-report.sh

  mkdir -p ${pkgdir}/var/lib/block-device-checksums
}
