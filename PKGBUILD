# Maintainer: DATSD <DAStudio *dot* 71e6fd52 *at* gmail *dot* com>
_basename=avhttp
pkgname=${_basename}-git
pkgver=2.9.9.r99
pkgrel=1
pkgdesc='Concurrent http downloader'
arch=('any')
url='http://avplayer.org/avhttp.html'
license=('custom')
depends=('boost')
optdepends=(
'zlib: gzip support'
'openssl: https support'
)
makedepends=('cmake' 'git')
provides=("${_basename}=${pkgver}")
conflicts=("${_basename}")
source=("${_basename}::git+https://github.com/avplayer/avhttp.git")
sha256sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_basename}"
  git describe --long --tags | sed 's/\([^-]*\)-g.*/r\1/;s/-/./g' | cut -c2-
}

build()
{
  cd "${srcdir}/${_basename}"

  rm -rf build
  mkdir build
  cd build

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
