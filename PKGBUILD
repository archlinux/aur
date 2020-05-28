# Maintainer: 3ED_0 <krzysztofas /at/ protonmail . com>
pkgname=deadbeef-plugin-rating
_pkgname=deadbeef-rating
pkgver=1.2
pkgrel=2
pkgdesc="rate songs by editing the metadata tag: rating"
url="https://github.com/splushii/deadbeef-rating"
arch=('i686' 'x86_64')
license=('GPL2') # or GPL3? who know?
depends=('deadbeef')
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/splushii/${_pkgname}/archive/${pkgver}.tar.gz"
  fix-path_for_include_deadbeef_h.patch
  Makefile
)
sha256sums=('2017bdd563c4f46a9af2d349ac8676b461969824ad1254cd653c7e70dcabff19'
            '1c99aab7c07fd129cebe4fb6a768ce729248e0e742f5a03223f8a830a8e17ab3'
            'a98bc49c1899f533707859b92fa54211fdc7576e2e89146605caf0eab16746f4')

prepare() {
  cd "${_pkgname}-${pkgver}"
  cp ../Makefile .
  patch -p1 -i ../fix-path_for_include_deadbeef_h.patch
}

build() {
  cd "${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make install PREFIX="/usr" DESTDIR="${pkgdir}"
}

