# Maintainer: Jie Zhu <lovelornpig@gmail.com>
# Developers: Olivier Delaneau <olivier.delaneau@gmail.com>
#             Halit Ongen <halit.ongen@unige.ch>
# please see: https://github.com/qtltools/qtltools

_basename="qtltools"
pkgname=${_basename}-git
pkgver=1.1.72.dd02b8e
pkgrel=1
pkgdesc="A complete tool set for molecular QTL discovery and analysis"
arch=('i686' 'x86_64')
url="https://github.com/alienzj/qtltools"
license=('GPLV3')
depends=('boost' 'bzip2' 'gzip' 'zip' 'gsl' 'cblas' 'blas' 'htslib' 'r')
provides=(${_basename}=${pkgver})
conflicts=(${_basename})
source=(${_basename}::git+https://github.com/alienzj/qtltools.git)
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

  install  -D -m644 "${srcdir}/${_basename}/README" \
           "${pkgdir}/usr/share/doc/${_basename}/README"
}
