# Maintainer: Igor Saric <karabaja4 at gmail.com>
# shellcheck disable=SC2148,SC2034,SC2154

pkgname=busybox-crond
pkgver=1
pkgrel=1
pkgdesc="Busybox crond implementation"
arch=('x86_64')
url="https://www.busybox.net"
license=('GPL')
depends=('busybox')
makedepends=('gcc')
conflicts=('cron')
provides=('cron')
source=("https://gitlab.alpinelinux.org/alpine/aports/-/raw/master/main/busybox/bbsuid.c")
sha256sums=('99f6275a53a4005d8f03d87e5361699419b33a52b2b2e2fe1c45e90ab6d51f58')

build() {
  gcc "bbsuid.c" -o "bbsuid"
}

package() {
  install -d "${pkgdir}/etc/crontabs"
  install -d "${pkgdir}/var/spool/cron"
  ln -sf "/etc/crontabs" "${pkgdir}/var/spool/cron/crontabs"

  install -Dm4111 "bbsuid" "${pkgdir}/usr/bin/bbsuid"
  ln -sf "/usr/bin/bbsuid" "${pkgdir}/usr/bin/crontab"

  ln -sf "/usr/bin/busybox" "${pkgdir}/usr/bin/crond"
}
