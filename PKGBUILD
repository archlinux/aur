# Maintainer: Jie Zhu <alienzj@eniac>
_basename="tianya"
pkgname=${_basename}-git
pkgver=0.1.r138.415ed64
pkgrel=1
pkgdesc="Tianya is a fantastic novel searcher and reader"
arch=('i686' 'x86_64')
url="https://github.com/avplayer/tianya"
license=('custom')
depends=('boost' 'qt5-base' 'openssl')
provides=(${_basename}=${pkgver})
conflicts=(${_basename})
source=(${_basename}::git+https://github.com/avplayer/tianya.git)
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_basename}"
  echo "0.1.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_basename}"
  
  if [[ -d build ]]; then
      rm -rf build
  fi
  mkdir build && cd build
  
  cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

package() {
  cd "${srcdir}/${_basename}/build"
  make install DESTDIR="${pkgdir}/"

  install  -D -m644 "${srcdir}/${_basename}/README.md" \
           "${pkgdir}/usr/share/doc/${_basename}/README"
}
