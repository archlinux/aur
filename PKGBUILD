# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
pkgname=('libkeybinder2' 'python2-keybinder2')
pkgbase=keybinder2
_offname=keybinder
pkgver=0.3.0
pkgrel=1
pkgdesc='Library for registering global keyboard shortcuts'
arch=('i686' 'x86_64')
url='http://kaizer.se/wiki/keybinder/'
license=('GPL')
makedepends=('pygtk')
source=(http://kaizer.se/publicfiles/${_offname}/${_offname}-${pkgver}.tar.gz)
sha256sums=('42863ca0174d568a8c02c6fb243fee1681823825e8bcb1718c51611d8e9793bb')

build() {
  cd "${srcdir}/${_offname}-${pkgver}"
  export PYTHON=/usr/bin/python2
  ./configure \
        --prefix=/usr \
        --disable-lua
  make
}

package_libkeybinder2() {
  pkgdesc='Library for registering global keyboard shortcuts'
  depends=('gtk2')

  cd "${srcdir}/${_offname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  rm -rf ${pkgdir}/usr/lib/python2.7
}

package_python2-keybinder2() {
  pkgdesc='Library for registering global keyboard shortcuts - Python 2 bindings'
  depends=('libkeybinder2' 'pygtk')
  provides=('python-keybinder')

  cd "${srcdir}/${_offname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  rm -rf ${pkgdir}/usr/lib/{girepository-1.0,libkeybinder*,pkgconfig}
  rm -rf ${pkgdir}/usr/{include,share}
}
