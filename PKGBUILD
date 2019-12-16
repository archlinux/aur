# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Colin Jones (xentalion) <colin@ergoeclectic.com>
# Contributor: Valère Monseur <valere dot monseur at ymail dot com>

_pkgname=cbatticon
pkgname=cbatticon-gtk3-git
pkgver=1.6.10.r0.ge4b1ec6
pkgrel=1
pkgdesc="A lightweight and fast battery icon that sits in your system tray"
arch=('i686' 'x86_64')
url="https://github.com/valr/cbatticon"
license=('GPL2')
depends=('libnotify' 'gtk3')
makedepends=('git')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")

source=("$pkgname::git+https://github.com/valr/cbatticon.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed -r 's,^[^0-9]*,,;s,-([0-9][0-9]*),.r\1,;s,[-_],.,g'
}

build() {
  cd ${pkgname}
  make WITH_NOTIFY=1 WITH_GTK3=1
}

package() {
  cd ${pkgname}
  make PREFIX="${pkgdir}/usr" install
}
