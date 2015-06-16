# Maintainer: Sergio Correia <sergio@correia.cc>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
# Contributor: Luke McCarthy <luke@iogopro.co.uk>

pkgname=nam
pkgver=1.15
pkgrel=3
pkgdesc="Tcl/TK based animation tool for viewing network simulation traces and real world packet traces"
url="http://www.isi.edu/nsnam/nam/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gcc-libs' 'otcl' 'sh')
makedepends=('tclcl')
source=(http://downloads.sourceforge.net/sourceforge/nsnam/nam-1/"${pkgver}"/nam-src-"${pkgver}".tar.gz
        nam-1.15-tcl86.patch)
sha256sums=('12ed547b3a5f8903890889d40cfea4d9bd66bb9ba6be99a0c753a9763cad8882'
            '2766040c6c367a03efa43e81cbe178150fad6f4ee0b2b6d0b87292cb7c0bfe0b')

prepare() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  patch -uNp1 -i ../nam-1.15-tcl86.patch
}

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  ./configure --prefix=/usr --with-tclcl=/usr/lib/tclcl
  make
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -d "${pkgdir}"/usr/bin
  make DESTDIR="${pkgdir}" install

  for dir in edu ex iecdemos bin; do
      install -dm755 "${pkgdir}"/usr/share/nam/"${dir}"
      install -m644 -t "${pkgdir}"/usr/share/nam/"${dir}" "${dir}"/*
  done
}

# vim:set ts=2 sw=2 et:
