# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xdg-launch-git
pkgver=0.3.r0.g4ee936c
pkgrel=1
pkgdesc="A command line XDG compliant launcher"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/xdg-launch"
license=('GPL')
groups=('xde')
provides=('xdg-launch')
conflicts=('xdg-launch')
depends=('desktop-file-utils' 'gtk2' 'libnotify' 'startup-notification')
optdepends=('dmenu: to use dmenu_launch script')
makedepends=('git' 'pkgconfig')
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/bbidulock/xdg-launch")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed -r 's,([^-]*-g),r\1,;s,-,.,g'
}

prepare() {
  cd ${pkgname}
  ./autogen.sh
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
