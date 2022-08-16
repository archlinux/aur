# Maintainer: Harenome Ranaivoarivony-Razanajato
#             <ranaivoarivony-razanajato@hareno.me>

pkgname=osl
pkgver=0.9.5
pkgrel=1
pkgdesc="OpenScop Library"
arch=('i686' 'x86_64')
url="http://icps.u-strasbg.fr/people/bastoul/public_html/development/openscop/index.html"
license=('BSD')
depends=("gmp")
provides=("osl")
source=(https://github.com/periscop/openscop/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('29eb7a37de5b3e723fe5f757875a2e1b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-gmp=system
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
