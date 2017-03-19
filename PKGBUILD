# Maintainer: Harenome Ranaivoarivony-Razanajato
#             <ranaivoarivony-razanajato@hareno.me>

pkgname=clan-git
pkgver=0.8.0.r10.g42a7d0c
pkgrel=1
pkgdesc="Chunky Loop Analyzer: A Polyhedral Representation Extraction Tool for High Level Programs"
arch=(x86_64)
url="http://icps.u-strasbg.fr/people/bastoul/public_html/development/clan/index.html"
license=('LGPL')
depends=("osl")
makedepends=("git")
provides=("clan")
conflicts=("clan")
source=(${pkgname}::git+https://github.com/periscop/clan.git)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  autoreconf -i
  ./configure --prefix=/usr --with-osl=system
  make
}

check() {
  cd "${srcdir}/${pkgname}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}
