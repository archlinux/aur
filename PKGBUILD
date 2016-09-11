# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=libgala-bzr
pkgver=r527
pkgrel=1
pkgdesc='The Pantheon Window Manager (library only)'
arch=('i686' 'x86_64')
url='https://launchpad.net/gala'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter-gtk' 'mutter' 'plank'
         'libgranite.so')
makedepends=('bzr' 'gnome-common' 'granite-bzr' 'intltool' 'vala')
provides=({lib,}gala="${pkgver}" libgala.so=0-64)
install='gala.install'
source=('bzr+lp:gala')
sha256sums=('SKIP')

pkgver() {
  cd gala

  echo "r$(bzr revno)"
}

build() {
  cd gala

  ./autogen.sh \
    --prefix='/usr' \
    --disable-schemas-compile
  make
}

package() {
  cd gala

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,lib/gala,share/{locale,applications,icons,gala}}
}

# vim: ts=2 sw=2 et:
