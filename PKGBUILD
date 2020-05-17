# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Lucky <archlinux@builds.lucky.li>

pkgname=tpacpi-bat-git
pkgver=3.1.r12.g4959b52
pkgrel=1
pkgdesc='A Perl script with ACPI calls for recent ThinkPads which are not supported by tp_smapi'
arch=('any')
url='https://github.com/teleshoes/tpacpi-bat'
license=('GPL3')
depends=('perl' 'acpi_call')
makedepends=('git')
provides=('tpacpi-bat')
conflicts=('tpacpi-bat')
backup=('etc/conf.d/tpacpi')
source=('git+https://github.com/teleshoes/tpacpi-bat.git')
b2sums=('SKIP')

pkgver() {
  cd ${pkgname/-git/}
  echo $(git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
}

package() {
  cd ${pkgname/-git/}

  install -Dm755 tpacpi-bat "${pkgdir}"/usr/bin/tpacpi-bat
  install -Dm644 examples/systemd_dynamic_threshold/tpacpi.service "${pkgdir}"/usr/lib/systemd/system/tpacpi-bat.service
  install -Dm644 examples/systemd_dynamic_threshold/tpacpi.conf.d "${pkgdir}"/etc/conf.d/tpacpi
}
