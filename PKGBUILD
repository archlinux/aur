# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
pkgname=('libkeybinder2' 'python2-keybinder2')
pkgbase=keybinder2
_offname=keybinder
pkgver=0.3.1
pkgrel=1
pkgdesc='Library for registering global keyboard shortcuts'
arch=('x86_64')
url='https://github.com/engla/keybinder'
license=('GPL')
makedepends=('pygtk' 'gnome-common' 'gtk-doc')
source=(https://github.com/engla/${_offname}/archive/master.zip)
sha256sums=('c242e57c045568f8132ba5edc57ab3e5b328288da8c7bf6f048c510b57af1a8e')

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
