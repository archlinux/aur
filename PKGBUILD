# $Id$
# Maintainer: Vic Luo <vicluo96@gmail.com>
# Co-Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=cppreference-devhelp
pkgver=20181028
pkgrel=1
pkgdesc="Offline cppreference documentation for devhelp."
arch=('any')
url="http://en.cppreference.com/w/"
license=('CCPL:cc-by-sa')
depends=('devhelp' 'cppreference')
makedepends=('python-lxml')
source=("http://upload.cppreference.com/mwiki/images/c/ca/cppreference-doc-${pkgver}.tar.xz")
sha256sums=('95fa25efaa9f68f145e4ebd063e8d3f30367e243480f18be52927790b5fc1966')

prepare() {
  cd "$srcdir/cppreference-doc-${pkgver}"
  sed -i 's#$(docdir)/html#$(docdir)#' Makefile
}

build() {
  cd "${srcdir}/cppreference-doc-${pkgver}"
  make docdir='/usr/share/doc/cppreference' doc_devhelp
}

package() {
  cd "${srcdir}/cppreference-doc-${pkgver}"
  install -DT -m 644 "output/cppreference-doc-en-c.devhelp2" \
    "${pkgdir}/usr/share/devhelp/books/cppreference-doc-en-c/cppreference-doc-en-c.devhelp2"
  install -DT -m 644 "output/cppreference-doc-en-cpp.devhelp2" \
    "${pkgdir}/usr/share/devhelp/books/cppreference-doc-en-cpp/cppreference-doc-en-cpp.devhelp2"
}
# vim:set ts=2 sw=2 et:
