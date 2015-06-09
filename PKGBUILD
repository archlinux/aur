# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=launchpad-integration-gtk3
pkgver=0.1.56.2
pkgrel=3
pkgdesc='A library to integrate launchpad urls into the menus'
arch=('i686' 'x86_64')
url="https://launchpad.net/${pkgname%-*}"
license=('GPL3')
depends=('gtk3' 'pygtk')
makedepends=('bzr' 'gobject-introspection')
install="${pkgname%-*}.install"
source=("${pkgname%-*}-${pkgver}.tar.gz::http://bazaar.launchpad.net/~ubuntu-desktop/launchpad-integration/ubuntu/tarball/189")
sha256sums=('SKIP')

build() {
  cd ~ubuntu-desktop/${pkgname%-*}/ubuntu

  export PYTHON='/usr/bin/python2'
  ./autogen.sh --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' --libexecdir="/usr/lib/${pkgname%-*}" --disable-static --with-gtk='3'
  make
}

package() {
  cd ~ubuntu-desktop/${pkgname%-*}/ubuntu

  make DESTDIR="${pkgdir}" install

# Fix permissions
  chmod 644 "${pkgdir}"/usr/share/launchpad-integration/launchpadintegration/*
}

# vim: ts=2 sw=2 et:
