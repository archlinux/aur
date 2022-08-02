# Maintainer: jamazi <jamazi@tutanota.com>

pkgname=jailbox-git
_pkgname=jailbox
pkgver=0.2.0.r2.gf77c902
pkgrel=1
pkgdesc="Torify the system with multiple tor exit nodes and load balance"
url="https://github.com/jamazi/jailbox.git"
license=("MIT")
depends=(tor iptables)
makedepends=("git")
arch=("any")
source=("git+https://github.com/jamazi/${_pkgname}.git")
backup=(etc/${_pkgname}/{torrc,config})
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$_pkgname"

  install -Dm644 config             "${pkgdir}"/etc/jailbox/config
  install -Dm644 torrc              "${pkgdir}"/etc/jailbox/torrc
  install -Dm644 version            "${pkgdir}"/etc/jailbox/version
  install -Dm755 jailbox-start      "${pkgdir}"/usr/bin/jailbox-start
  install -Dm755 jailbox-stop       "${pkgdir}"/usr/bin/jailbox-stop
  install -Dm755 jailbox-post-start "${pkgdir}"/usr/bin/jailbox-post-start
  install -Dm755 jailbox-pre-stop   "${pkgdir}"/usr/bin/jailbox-pre-stop
  install -Dm755 unjailbox          "${pkgdir}"/usr/bin/unjailbox
  install -Dm644 jailbox.service    "${pkgdir}"/usr/lib/systemd/system/jailbox.service
}
