# Maintainer: <alienchuj@gmail.com>

_basename=metalog
pkgname=${_basename}-git
pkgver=0.1.r13.9dfd0dd
pkgrel=1
pkgdesc='A meta-template style log system for C++'
arch=('any')
url='http://github.com/Sleeplessy/metalog'
license=('Apache License 2.0')
makedepends=('cmake' 'git')
provides=("${_basename}=${pkgver}")
conflicts=("${_basename}")
source=("${_basename}::git+https://github.com/Sleeplessy/metalog.git")
sha256sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_basename}"
  echo "0.1.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build()
{
  cd "${srcdir}/${_basename}"

  if [[ -d build ]]; then
    rm -rf build
  fi

  mkdir build && cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

package()
{
  cd "${srcdir}/${_basename}/build"
  make install DESTDIR="${pkgdir}/"

  install -D -m644 "${srcdir}/${_basename}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_basename}/LICENSE"
}
