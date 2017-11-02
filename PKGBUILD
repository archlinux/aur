# Maintainer: Nathan Lowe <techwiz96@gmail.com>
pkgname=matiec-hg
provides=('matiec')
conflicts=('matiec')
_pkgver=0.1
pkgver=0.1.r1063.1ac77681946f
pkgrel=2
pkgdesc="An open source compiler for the programming languages defined in the IEC 61131-3 standard"
builddepends=('mercurial')
arch=('i686' 'x86_64')
url="https://bitbucket.org/mjsousa/matiec"
license=('GPL3')
source=("$pkgname::hg+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "${_pkgver}.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "${srcdir}/${pkgname}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/usr/lib/matiec"
  cp -R "${srcdir}/${pkgname}/lib/." "${pkgdir}/usr/lib/matiec"
}
