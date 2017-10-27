# Maintainer: alienzj <lovelornpig@gmail.com>
_basename="catch"
pkgname=${_basename}-git
pkgver=2.0.0.r1886.06586b71
pkgrel=1
pkgdesc='A modern, C++-native, header-only, test framework for unit-tests, TDD and BDD - using C++98, C++03, C++11, C++14 and later'
arch=('i686' 'x86_64')
url="https://github.com/philsquared/Catch"
license=('Boost Software License 1.0')
makedepends=('git' 'cmake>=3.0.0')
provides=(${_basename}=${pkgver})
conflicts=(${_basename})
source=(${_basename}::git://github.com/philsquared/Catch.git)
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_basename}"
  echo "2.0.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_basename}"
  
  if [[ -d build ]]; then
      rm -rf build
  fi
  mkdir build && cd build
  
  cmake .. \
	-DCMAKE_BUILD_TYPE=Release \
  	-DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "${srcdir}/${_basename}/build"
  make install DESTDIR="${pkgdir}/"

  install  -D -m644 "${srcdir}/${_basename}/README.md" \
           "${pkgdir}/usr/share/doc/${_basename}/README"

  install  -D -m644 "${srcdir}/${_basename}/LICENSE.txt" \
           "${pkgdir}/usr/share/licenses/${_basename}/LICENSE"
}
