# Maintainer: dreieck
# Contributor: nem <nem at posteo dot net>
# Submitter: nem <nem at posteo dot net> 

_pkgname="adms"
pkgname="${_pkgname}-git"
pkgver=2.3.7.r6.g2097728
pkgrel=2
pkgdesc="ADMS is a codegenerator for the VERILOG-A(MS) language"
arch=(
  'x86_64'
  'i686'
)
url="https://github.com/qucs/${_pkgname}"
license=('GPL')
depends=('glibc')
makedepends=(
  'autoconf'
  'automake'
  'bison'
  'flex'
  'git'
  'perl-gd'
  'perl-xml-libxml'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/qucs/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed -r 's/^release-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./bootstrap.sh
  ./configure --enable-maintainer-mode --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
