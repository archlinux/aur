# Maintainer: alienzj <alienchuj@gmail.com>

_basename="seqan3"
pkgname=${_basename}-git
pkgver=3.0.0.r465.g4cdd84b2
pkgrel=1
pkgdesc="The modern C++ library for sequence analysis. Contains version3 of the library and API docs."
arch=('i686' 'x86_64')
url="http://www.seqan.de"
license=('custom')
depends=('gcc-libs' 'range-v3' 'sdsl-lite-v3-git')
optdepends=('bzip2: bzip2 support'
            'zip: zip support'
            'coin-or-lemon: graphs, required for MSA'
            'cereal: serialisation support'
            'benchmark'
            'gtest'
            'doxygen')
makedepends=('cmake' 'gcc' 'make')
provides=(${_basename}=${pkgver})
conflicts=(${_basename})
source=("seqan3::git+https://github.com/seqan/seqan3.git")
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_basename}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_basename}"
  # install -D -m644 "${srcdir}/${_basename}/include/${_basename}" \
    #         "$pkgdir/usr/include/${_basename}"
  mkdir -p "$pkgdir/usr/include"
  cp -rf "${srcdir}/${_basename}/include/${_basename}" \
     "$pkgdir/usr/include/${_basename}"
}
