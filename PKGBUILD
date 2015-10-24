# Maintainer: sumt <sci.fi: sumt>
# Contributor: Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor: Janne Haapsaari	<iki.fi: haaja>

pkgname=hfstospell-svn
pkgver=0.3.1.r4502
pkgrel=1
pkgdesc='Helsinki Finite-State Transducer Technology (HFST) tools'
arch=('i686' 'x86_64')
url='http://www.ling.helsinki.fi/kieliteknologia/tutkimus/hfst/'
license=('APACHE')
depends=('libxml++' 'libarchive' 'icu')
makedepends=('svn')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!libtool)
source=('hfstospell-svn::svn+http://svn.code.sf.net/p/hfst/code/trunk/hfst-ospell')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local release="$(grep AC_INIT configure.ac | sed -e 's/AC_INIT([^,]\+,\s*\[\?\([0-9.a-z-]\+\).*/\1/')"
  local rev="$(svnversion)"
  printf "%s.r%s" "$release" "${rev//[[:alpha:]]}"
}

build() {
  cd "$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package () {
   cd "$pkgname"
   make DESTDIR="${pkgdir}" install
}

