# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jesse Watson <me@9mmtylenol.me>
# Contributor: Alex Amadori <tacchinotacchi@gmail.com>

_name=rtbth-dkms
pkgname=rtbth-dkms-git
pkgver=3.9.6.r7.gce4e65d
pkgrel=1
pkgdesc="rtbth Kernel module sources for Ralink RT3290 bluetooth, lomiu's solution."
arch=('i686' 'x86_64')
url='http://www.mediatek.com/'
license=('mixed')
depends=('dkms')
optdepends=('bluez: Canonical implementation of bluetooth protocol'
'bluez-utils: Utilities for Bluez')
conflicts=('rtbth-dkms')
provides=('rtbth')
install='rtbth-dkms.install'
source=('git+https://github.com/loimu/rtbth-dkms.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_name"
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/src
  mkdir -p "${pkgdir}"/etc/modprobe.d/
  cp -r ./ "${pkgdir}/usr/src/${provides}-${pkgver}"
  cp tools/rtbt "${pkgdir}"/usr/bin/rtbt
  cp tools/ralink-bt.conf "${pkgdir}"/etc/modprobe.d/ralink-bt.conf
}
