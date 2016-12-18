# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Allen Choong <allencch at hotmail dot com>

pkgname=scanmem-git
pkgver=0.16.892.5f14e5f
pkgrel=1
pkgdesc='Memory scanner designed to isolate the address of an arbitrary variable in an executing process'
url='https://github.com/scanmem/scanmem'
arch=('i686' 'x86_64')
license=('GPL3')
provides=('scanmem')
conflicts=('scanmem')
depends=('gtk3' 'python-gobject' 'polkit')
makedepends=('git' 'intltool')
source=(${pkgname}::git+https://github.com/scanmem/scanmem.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git tag|sort|tail -n1|sed -r 's|-|.|g'|sed -r 's|v?(.*)|\1|')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  ./autogen.sh
}

build() {
  cd ${pkgname}
  ./configure --enable-gui --prefix=/usr
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
