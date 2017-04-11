# Maintainer: Harenome Ranaivoarivony-Razanajato
#             <ranaivoarivony-razanajato@hareno.me>

pkgname=clan
pkgver=0.8.1
pkgrel=1
pkgdesc="Chunky Loop Analyzer: A Polyhedral Representation Extraction Tool for High Level Programs"
arch=(x86_64)
url="http://icps.u-strasbg.fr/people/bastoul/public_html/development/clan/index.html"
license=('LGPL')
depends=("osl")
checkdepends=("valgrind")
provides=("clan")
source=(https://github.com/periscop/clan/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('bffd26cc8b1360e47245ef71cea78aa3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-osl=system
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
  make valcheck
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
