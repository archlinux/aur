# Maintainer: Harenome Ranaivoarivony-Razanajato
#             <ranaivoarivony-razanajato@hareno.me>

pkgname=osl
pkgver=0.9.0
pkgrel=2
pkgdesc="OpenScop Library"
arch=(x86_64)
url="http://icps.u-strasbg.fr/people/bastoul/public_html/development/openscop/index.html"
license=('BSD')
depends=("gmp")
provides=("osl")
source=(http://icps.u-strasbg.fr/people/bastoul/public_html/development/openscop/docs/${pkgname}-${pkgver}.tar.gz)
md5sums=('d1aa20732b61c5c20e153d9d850e732f')

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
