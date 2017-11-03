# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
pkgname=lttoolbox-svn
_pkgname=lttoolbox
pkgver=3.3.3.r83054
pkgrel=1
pkgdesc="Language-independent machine translation engine and tools to manage language data."
url="https://apertium.org"
license=('GPL2')
makedepends=('svn')
depends=('libxml2')
options=('!libtool')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
arch=('i686' 'x86_64')
source=("svn://svn.code.sf.net/p/apertium/svn/trunk/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  local ver="${pkgver%%.r*}"
  local rev="$(svnversion)"
  printf "%s.r%s" "${ver}" "${rev//[[:alpha:]]}"
}

build() {
  cd "$srcdir/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}
