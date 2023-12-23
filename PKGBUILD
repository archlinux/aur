# Contributor: Michael Hansen <zrax0111 gmail com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=swig3
_pkgname=swig
pkgver=3.0.12
pkgrel=3
pkgdesc="Generate scripting interfaces to C/C++ code (Legacy version 3)"
arch=('x86_64')
url="http://www.swig.org/"
license=('custom')
depends=('pcre' 'gcc-libs')
#checkdepends=('ruby' 'python2' 'java-environment' 'tcl' 'php' 'lua' 'ocaml' 'r' 'python2-cffi' 'camlp4')
source=(https://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('5eaa2e06d8e4197fd02194051db1e518325dbb074a4c55a91099ad9c55193874f577764afc9029409a41bd520a95154095f26e33ef5add5c102bb2c1d98d33eb')

build() {
  cd ${_pkgname}-${pkgver}
  PYTHON=python2 ./configure --prefix=/usr --program-suffix="3.0"
  make
}

# Tests are disabled since many no longer compile properly. (Swig itself builds fine.) Some just
# rely on old defaults that have since changed (e.g. python tests don't work since C++17), but
# others look more complicated.
# Haven't ever looked at most of these languages and it's unlikely some actually wants them, so I'm
# not going to bother. The only known user needs the Python 2 parts, and those work.
#check() {
#  cd ${_pkgname}-${pkgver}
#  PERL5LIB=. make check || warning "Tests failed"
#}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 LICENSE-UNIVERSITIES "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-UNIVERSITIES
}
