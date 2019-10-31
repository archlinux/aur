# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Lucky <archlinux@builds.lucky.li>

pkgname=tpacpi-bat-git
pkgver=119.4959b52
pkgrel=1
pkgdesc='A Perl script with ACPI calls for recent ThinkPads (such as T420 and W520) whose battery thresholds are not supported by tp_smapi'
arch=('any')
url='https://github.com/teleshoes/tpacpi-bat'
license=('GPLv3')
depends=('perl' 'acpi_call')
makedepends=('git')
provides=('tpacpi-bat')
conflicts=('tpacpi-bat')
backup=('etc/conf.d/tpacpi')
source=(git://github.com/teleshoes/tpacpi-bat.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname/-git/}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd ${pkgname/-git/}

  install -Dm755 tpacpi-bat "${pkgdir}"/usr/bin/tpacpi-bat
  install -Dm644 examples/systemd_dynamic_threshold/tpacpi.service "${pkgdir}"/usr/lib/systemd/system/tpacpi-bat.service
  install -Dm644 examples/systemd_dynamic_threshold/tpacpi.conf.d "${pkgdir}"/etc/conf.d/tpacpi
}
