# Maintainer: Parker Reed <parker.l.reed@gmail.com>

pkgname=vfs495-daemon
pkgver=4.5
pkgrel=118.00
pkgdesc="Userspace driver for VFS495 fingerprint readers"
arch=('x86_64')
url=""
license=('unknown')
depends=('openssl098' 'libusb-compat')
makedepends=('rpmextract')
provides=('vfs495-daemon')
source=('https://dl.dropboxusercontent.com/u/71679/Validity-Sensor-Setup-4.5-118.00.x86_64.rpm'
	'vfs495-daemon.service')
noextract=()
md5sums=('b31117a84f8cb0561648b39957ba5393'
         'c8cab102230f518158b6ecd38b1ff85a')

build() {
  cd "${srcdir}/"

  rpmextract.sh Validity-Sensor-Setup-4.5-118.00.x86_64.rpm
  rm -rf usr/lib64/
  mv usr/sbin/* usr/bin/
  rmdir usr/sbin/
}

package() {
  cd "${srcdir}/"

  cp -R usr/ "${pkgdir}/"
  mkdir -p "${pkgdir}/etc/systemd/system"
  cp vfs495-daemon.service "${pkgdir}/etc/systemd/system"
}
