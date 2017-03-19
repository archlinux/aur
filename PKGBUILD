# Maintainer: Harenome Ranaivoarivony-Razanajato
#             <ranaivoarivony-razanajato@hareno.me>

pkgname=clan
pkgver=0.8.0
pkgrel=1
pkgdesc="Chunky Loop Analyzer: A Polyhedral Representation Extraction Tool for High Level Programs"
arch=(x86_64)
url="http://icps.u-strasbg.fr/people/bastoul/public_html/development/clan/index.html"
license=('LGPL')
depends=("osl")
provides=("clan")
source=(http://icps.u-strasbg.fr/people/bastoul/public_html/development/clan/docs/${pkgname}-${pkgver}.tar.gz)
md5sums=('0dcba7f4bdf32159405f27ebce439d63')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # The configure script's '--with-osl=system' option is buggy. The definitions
  # of OSL_LIBS differ depending on the value of '--with-osl' but all of them
  # can be overriden since the script will be called with '--with-osl=system'...
  sed -i 's/OSL_LIBS=.*/OSL_LIBS=" -losl"/' configure
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-osl=system
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
