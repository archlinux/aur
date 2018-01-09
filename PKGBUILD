# Maintainer: alienzj <lovelornpig@gmail.com>

_basename="sdsl-lite"
pkgname=${_basename}-v3-git
pkgver=3.0.0.r2016.ecd007a
pkgrel=1
pkgdesc="Succinct Data Structure Library 3.0(unstable,prerelease)"
arch=('i686' 'x86_64')
url="https://github.com/xxsds/sdsl-lite"
license=('BSD 3-clause "New" or "Revised" License')
makedepends=('git' 'cmake>=3.2.0')
provides=(${_basename})
conflicts=(${_basename} ${_basename}-git ${_basename}-v2 ${_basename}-v2-git ${_basename}-v3)
source=(${_basename}::git+https://github.com/xxsds/sdsl-lite.git)
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/${_basename}"
  echo "3.0.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_basename}"

  if [[ -d build_ ]]; then
      rm -rf build_
  fi
  mkdir build_ && cd build_

  cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

package() {
  cd "${srcdir}/${_basename}/build_"
  make install DESTDIR="${pkgdir}/"

  install -D -m644 "${srcdir}/${_basename}/README.md" \
          "${pkgdir}/usr/share/doc/${_basename}/README"
}
