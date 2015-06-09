# Maintainer: Swift Geek
#TODO: sed for changing % of free ram to trigger
#TODO: sed for changing oom-killer method
#TODO: sed for fixing *.service executable path (syslog might be also bad)
#TODO: approperiate install messages

pkgname=earlyoom-git
_pkgname=${pkgname%-*}
pkgver=0
pkgrel=1
pkgdesc="The Early OOM Daemon"
arch=('any')
url="https://github.com/rfjakob/earlyoom"
license=('GPL')
makedepends=('git')
source=("git://github.com/rfjakob/earlyoom.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD # Fix to better comply with github display
}

build() {
  cd "$srcdir/${_pkgname}/"
  make earlyoomd
}

package() {
  cd "$srcdir/${_pkgname}/"
  install -d "$pkgdir/usr/bin/"
  install -d "$pkgdir/usr/lib/systemd/system/"
  install -m 644 ./earlyoom.service "${pkgdir}/usr/lib/systemd/system/earlyoom.service"
  install -m 755 ./earlyoom "${pkgdir}/usr/bin/earlyoom"
}
