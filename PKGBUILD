# Maintainer: Fabian Maurer <dark.shadow4@web.de>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_name=talloc
pkgname=lib32-${_name}
pkgver=2.4.0
pkgrel=1
pkgdesc='A hierarchical pool based memory allocator with destructors'
arch=('x86_64')
url='http://talloc.samba.org/'
license=('GPL3')
source=("https://samba.org/ftp/${_name}/${_name}-${pkgver}.tar.gz")
depends=('talloc')
makedepends=('python')
sha256sums=('6df36862c42466ef88f360444513870ef46934f9016c84383cc4008a7d0c46ba')

build() {
  cd ${_name}-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr \
     --libdir='/usr/lib32' \
     --sysconfdir=/etc/samba \
     --localstatedir=/var \
     --bundled-libraries=NONE \
     --builtin-libraries=replace \
     --enable-talloc-compat1 \
     --disable-python

  make
}

package() {
  cd ${_name}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
}
