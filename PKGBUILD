# Maintainer: Fabian Köhler <fabian2804 (AT) googlemail (DOT) com >

pkgname=dieharder
pkgver=3.31.1
pkgrel=4
pkgdesc="A Random Number Test Suite"
arch=('i686' 'x86_64')
depends=('gsl')
url="http://www.phy.duke.edu/~rgb/General/dieharder.php"
license=('GPL')
source=("http://www.phy.duke.edu/~rgb/General/dieharder/${pkgname}-${pkgver}.tgz"
        'autogen.patch'
        'stdint.patch')
sha256sums=('6cff0ff8394c553549ac7433359ccfc955fb26794260314620dfa5e4cd4b727f'
            '0df2d1957accfebba3e4083f7e1184aac10091c93f79a3174c79ebdae613831d'
            '1ea17f15580fa9ac8831d20a3e4f5c412b8330bf2183f704371e167206497714')
provides=('dieharder')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -uN autogen.sh ../autogen.patch || return 1
  patch -uN include/dieharder/libdieharder.h ../stdint.patch || return 1
  ./autogen.sh
  make -j1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
