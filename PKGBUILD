# Maintainer: Michael Gwin <oksijun+arch at gmail dot com>

pkgname=qspeakers
pkgver=1.0.1
pkgrel=1
pkgdesc="DIY speaker design software"
url="http://brouits.free.fr/qspeakers/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qwt-qt5')
conflicts=('qspeakers-svn')
source=(
  "http://brouits.free.fr/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  "qwt-qt5.patch"
)
 
sha256sums=(
  'ab2f8fc98287f25c9be6dae914cd51fa387cd487c0f2c6dc03dc0c6db981263f'
  'e46d4dccb277f1a6ff5b9996184321fff3094e3ba59991bc273e8b97129bd7ac'
)
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../qwt-qt5.patch
  qmake-qt5 PREFIX=/usr -config release
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
