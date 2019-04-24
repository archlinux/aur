# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Eric Le Lay <contact at elelay dot fr>

pkgname=ansifilter
pkgver=2.14
pkgrel=1
pkgdesc="remove or convert ANSI codes to another format"
arch=('i686' 'x86_64')
url="http://www.andre-simon.de/doku/ansifilter/en/ansifilter.php"
license=('GPL3')
depends=('gcc-libs')
source=("http://www.andre-simon.de/zip/${pkgname}-${pkgver}.tar.bz2"
        "ansifilter-flags.patch")
sha256sums=('e2eee3912718b226d3217e2848e5c5a447bf30b7fbb9f0ebc8dd4ddfeb4797af'
            '2d2feb27f4e07a78c95d423ecea144e225940508004e023d21c8bb67ae77c72a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/ansifilter-flags.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}/usr/share/doc/ansifilter/COPYING" \
     "${pkgdir}/usr/share/doc/ansifilter/INSTALL"
}
