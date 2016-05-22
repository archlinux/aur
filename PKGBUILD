# Maintainer: Adler Ferreira <adler dot m dot f at gmail dot com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=onscripter-en
pkgver=20110930
pkgrel=4
pkgdesc="English version of the open source interpreter for the visual novel game scripting engine NScripter"
arch=('i686' 'x86_64')
url='http://onscripter.unclemion.com/'
license=('GPL')
depends=('sdl_mixer' 'sdl_image' 'sdl_ttf')
# Dependency 'smpeg' 'bzip2' already satisfied
source=(https://www.dropbox.com/s/ag21owy9poyr2oy/${pkgname}-${pkgver}-src.tar.bz2)
md5sums=('6c22a3c919098075d24b03c4e6d4e3cc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --no-werror
  sed -i 's/.dll//g' Makefile
  make
}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m644 BUGS CHANGES INSTALL README "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
