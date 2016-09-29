pkgname=mingw-w64-arpack++
pkgver=1.2
pkgrel=1
pkgdesc="an object-oriented version of the ARPACK package (mingw-w64)"
arch=('any')
url="http://www.ime.unicamp.br/~chico/arpack++/"
license=('BSD')
depends=('mingw-w64-arpack')
source=(http://www.ime.unicamp.br/~chico/arpack++/arpack++.tar.gz
        http://reuter.mit.edu/download/arpackpp1.2.patch.diff)
md5sums=('ba746bd46ea53ed2f141c806e36c60b2' '09c778d6fd3815974d4b9ef940c31129')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd ${srcdir}/arpack++
  patch -Np1 -i ../arpackpp${pkgver}.patch.diff || return 1
}

package()
{
  cd ${srcdir}/arpack++

  # install headers
  for _arch in ${_architectures}; do
    install -d ${pkgdir}/usr/${_arch}/include/arpack++
    install include/*.h ${pkgdir}/usr/${_arch}/include/arpack++
  done
}


