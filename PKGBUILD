# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xdg-launch-git
pkgver=0.9.r0.g026cc0b
pkgrel=1
pkgdesc="A command line XDG compliant launcher"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/xdg-launch"
license=('GPL')
groups=('xde')
provides=('xdg-launch')
conflicts=('xdg-launch')
depends=('libxrandr' 'libxinerama' 'libnotify')
optdepends=('dmenu: to use dmenu_launch script')
makedepends=('git' 'pkgconfig')
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
  ./configure --prefix=/usr --sysconfdir=/etc \
              --disable-status-icon
  make V=0
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
