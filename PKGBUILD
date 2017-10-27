# Maintainer: alienzj <lovelornpig@gmail.com>
_basename="rang"
pkgname=${_basename}-git
pkgver=2.1.r109.866b9ad
pkgrel=1
pkgdesc="A Minimal, Header only Modern c++ library for colors in your terminal"
arch=('i686' 'x86_64')
url="https://github.com/agauniyal/rang"
license=('The Unlicense')
makedepends=('git' 'cmake>=3.0.0')
provides=(${_basename}=${pkgver})
conflicts=(${_basename})
source=(${_basename}::git+https://github.com/agauniyal/rang.git)
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_basename}"
  echo "2.1.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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

  install  -D -m644 "${srcdir}/${_basename}/LICENSE" \
           "${pkgdir}/usr/share/licenses/${_basename}/README"
}
