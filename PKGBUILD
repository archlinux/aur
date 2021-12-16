# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Iru Dog <mytbk920423@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>

pkgname=systemd-ui-git
_pkgname=systemd-ui
pkgver=3.r2.g4e6ab2e4
pkgrel=5
pkgdesc="Graphical front-end for systemd"
arch=('x86_64' 'i686')
url="https://www.freedesktop.org/wiki/Software/systemd"
license=('GPL')
depends=('gtk3' 'libgee' 'libnotify')
makedepends=('git' 'vala0.26' 'docbook-xsl' 'libxslt')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
source=("$pkgname::git+https://github.com/freedesktop/systemd-ui.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
