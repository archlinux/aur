# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Sebastien Duthil <duthils@duthils.net>
export CFLAGS="${CFLAGS//-Werror/}" export CXXFLAGS="${CXXFLAGS//-Werror/}"
pkgname=open-adventure
pkgver=1.21
pkgrel=1
pkgdesc="Port of the 'Colossal Cave Adventure' text-based adventure game"
arch=('i686' 'x86_64')
url="http://www.catb.org/~esr/open-adventure/"
license=('BSD')
makedepends=('python' 'python-yaml' 'asciidoc' 'libedit')
conflicts=('advent')
source=(https://gitlab.com/esr/open-adventure/-/archive/${pkgver}/open-adventure-${pkgver}.tar.bz2)
sha256sums=('8ddff48254f868999957bef5f9a1606140d8cacae4a4d87f676fd819876e57c6')

build() {
  cd "${pkgname}-${pkgver}"
  export CFLAGS="-O2 -g -march=x86-64 -mtune=generic"
  export CXXFLAGS="$CFLAGS"
  make advent advent.6
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 advent "${pkgdir}/usr/bin/advent"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 -t "${pkgdir}/usr/share/doc/$pkgname" NEWS.adoc hints.adoc history.adoc README.adoc notes.adoc
  install -Dm644 advent.6 "${pkgdir}}/usr/share/man/man6/advent.6"
}
