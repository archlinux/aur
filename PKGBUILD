# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=stanford-wbc
_pkgname=stanford_wbc
pkgver=1.1
pkgrel=1
pkgdesc="The Whole-Body Control framework provides a framework for developing robot behaviors that use operational-space hierarchical task decompositions."
arch=('i686' 'x86_64')
url="https://github.com/poftwaresatent/stanford_wbc"
license=('LGPL')
depends=('eigen2')
makedepends=('cmake')
optdepends=('fltk11: GUI for tutorials')
source=(https://github.com/poftwaresatent/${_pkgname}/archive/${_pkgname}-${pkgver}.tar.gz
        gcc_fix.patch
        rename_yaml_cpp.patch
        fltk_status.patch
        fltk_window.patch
        install_opspace_library.patch
        install_tutorials.patch
        install_reflexxes_otg.patch)
md5sums=('2730be485a42bf06b7c595eddc5ce478'
         '3aec4688278cb7a683baddbd4a41beb9'
         '6637c24e7d15a979f54e6ce341eb2845'
         '0643c643fff18ce9220f3a1864c13a80'
         '51b718c93ebf96616773210371c3bbef'
         '2a1bd7fa12c7fc326b08fea919a7ee83'
         '6b55a631992ce841456c090db7b443d9'
         '122a84f5f8c0b0ebec8ffd66e3863db5')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"

  patch -p1 < "${srcdir}/gcc_fix.patch"
  patch -p1 < "${srcdir}/rename_yaml_cpp.patch"
  patch -p1 < "${srcdir}/fltk_status.patch"
  patch -p1 < "${srcdir}/fltk_window.patch"
  patch -p1 < "${srcdir}/install_opspace_library.patch"
  patch -p1 < "${srcdir}/install_tutorials.patch"
  patch -p1 < "${srcdir}/install_reflexxes_otg.patch"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
