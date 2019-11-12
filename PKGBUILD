# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Eric Le Lay <contact at elelay dot fr>

pkgname=ansifilter
pkgver=2.15
pkgrel=1
pkgdesc="remove or convert ANSI codes to another format"
arch=('i686' 'x86_64' 'pentium4' 'i486')
url="http://www.andre-simon.de/doku/ansifilter/en/ansifilter.php"
license=('GPL3')
depends=('gcc-libs')
source=("http://www.andre-simon.de/zip/${pkgname}-${pkgver}.tar.bz2"
        "ansifilter-flags.patch")
sha256sums=('7eea2ffaf3b829722304b57745321eecd7eec2b4be1027b22ed6cd6e14a4a11f'
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
