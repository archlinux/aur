# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor : Andy Weidenbaum <archbaum@gmail.com>

pkgname=tscat
pkgver=1.0
pkgrel=2
pkgdesc="Prepend a timestamp to each line of STDIN"
arch=('i686' 'x86_64' 'aarch64')
url="https://www.gerg.ca/software/tscat/"
makedepends=('gcc' 'make')
license=('MIT')
source=(https://www.gerg.ca/software/${pkgname}/${pkgname}-${pkgver}.tar.gz
        Makefile.patch)
sha256sums=('aafed58a69c6bb5fdddae3dfc8ec4ebfc465d17192ced4e21652bdbd4d73f614'
            '1007627c3139e8c5bda8c9542952730d2b526a497e55e16de81772e31192d70b')
provides=('tscat')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/Makefile.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install PREFIX="${pkgdir}/usr" DESTDIR="${pkgdir}"
}
