# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Allen Choong <allencch at hotmail dot com>

pkgname=scanmem-git
pkgver=0.15.4.20.g063c588
pkgrel=1
pkgdesc="Memory scanner designed to isolate the address of an arbitrary variable in an executing process"
url="https://github.com/scanmem/scanmem"
arch=('i686' 'x86_64')
license=('GPL3')
provides=('scanmem')
conflicts=('scanmem')
depends=('pygtk' 'python-gobject' 'polkit')
makedepends=('git' 'intltool')
install=scanmem.install
source=(${pkgname}::git+https://github.com/scanmem/scanmem.git
        drop-gtk-update-icon.patch)
sha512sums=('SKIP'
            '5df78e2dcdaf5c2bf355911f9851375ffeed819dd50bfdc47c5cb8096eaa9b7aa69b7852b937b782661e27d213d8543309dedd92ada38e225fd1375e3f12fe3c')

pkgver() {
  cd ${pkgname}
  git describe --always|sed 's|-|.|g'|sed -r 's|v(.*)|\1|'
}

prepare() {
  cd ${pkgname}
  patch -Rp1 < "${srcdir}/drop-gtk-update-icon.patch"
}

build() {
  cd ${pkgname}
  ./autogen.sh
  ./configure --enable-gui --prefix=/usr
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
