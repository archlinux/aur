# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
pkgname=('libkeybinder2' 'python2-keybinder2')
pkgbase=keybinder2
_offname=keybinder
pkgver=0.3.0
pkgrel=2
pkgdesc='Library for registering global keyboard shortcuts'
arch=('i686' 'x86_64')
url='https://github.com/engla/keybinder'
license=('GPL')
makedepends=('pygtk' 'gnome-common' 'gtk-doc')
source=(https://github.com/engla/${_offname}/archive/master.zip)
sha256sums=('30e46747a76b38395b669079edd0532d3ed8c818d13dd6cbd32da9ffc012919b')

build() {
  cd "${srcdir}/${_offname}-master"
  export PYTHON=/usr/bin/python2
  ./autogen.sh \
    --prefix=/usr
  make
}

package_libkeybinder2() {
  pkgdesc='Library for registering global keyboard shortcuts'
  depends=('gtk2')

  cd "${srcdir}/${_offname}-master"
  make DESTDIR="${pkgdir}/" install
  rm -rf "${pkgdir}/usr/lib/python2.7"
}

package_python2-keybinder2() {
  pkgdesc='Library for registering global keyboard shortcuts - Python 2 bindings'
  depends=('libkeybinder2' 'pygtk')
  provides=('python-keybinder')

  cd "${srcdir}/${_offname}-master"
  make DESTDIR="${pkgdir}/" install
  rm -rf "${pkgdir}"/usr/lib/{girepository-1.0,libkeybinder*,pkgconfig}
  rm -rf "${pkgdir}"/usr/{include,share}
}
