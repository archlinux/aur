# Maintainer: Maxime Gauduin <alucryd@archlinux.org> 

pkgname=pantheon-dock-bzr
pkgver=r1050
pkgrel=1
pkgdesc='The Pantheon Dock'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-dock'
license=('GPL3')
depends=('bamf' 'libdbusmenu-gtk3' 'libgee')
makedepends=('bzr' 'gnome-common' 'intltool' 'vala')
provides=('pantheon-dock' 'plank')
conflicts=('pantheon-dock' 'plank')
install='pantheon-dock.install'
source=('bzr+lp:pantheon-dock')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-dock

  printf "r%s" "$(bzr revno)"
}

build() {
  cd ${pkgname%-*}

  ./autogen.sh \
    --prefix='/usr' \
    --sysconfdir='/etc' \
    --disable-apport
  make
}

package() {
  cd pantheon-dock

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
