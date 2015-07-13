# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=simpfand-git
pkgver=v4.2.9.gaa475fc
pkgrel=1
pkgdesc="A simple fan control daemon for ThinkPads"
arch=('i686' 'x86_64')
url="http://github.com/hspak/simpfand"
license=('MIT')
depends=()
makedepends=('git')
conflicts=('simpfand')
provides=('simpfand')
source=("git://github.com/hspak/simpfand")
install=simpfand-git.install
md5sums=('SKIP')

pkgver() {
  cd 'simpfand'
  git describe | sed 's/-/./g'
}

build() {
  make -C simpfand
}

package() {
  make -C simpfand PREFIX=/usr DESTDIR="$pkgdir" install
  install -D -m644 "${srcdir}/simpfand/simpfand.service" "${pkgdir}/usr/lib/systemd/system/simpfand.service"
  install -D -m755 "${srcdir}/simpfand/restart-simpfand.sh" "${pkgdir}/usr/lib/systemd/system-sleep/restart-simpfand.sh"

  # license
  install -D -m644 "${srcdir}/simpfand/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ft=sh syn=sh et
