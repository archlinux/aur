# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=libarchive
pkgname=${_pkgname}-git
pkgver=v3.1.2.r1001.8c0c4fd7
pkgrel=1
pkgdesc="library that can create and read several streaming archive formats - git version"
arch=('i686' 'x86_64')
url="http://libarchive.org/"
license=('BSD')
depends=('acl' 'attr' 'bzip2' 'expat' 'lz4' 'lzo' 'openssl' 'xz' 'zlib')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://github.com/libarchive/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${_pkgname}"

  build/autogen.sh
  ./configure --prefix=/usr \
              --without-xml2 \
              --without-nettle
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make install DESTDIR="${pkgdir}"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
