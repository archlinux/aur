# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Maintainer: ???
# Contributor: Flemming Madsen (arch at themadsens dot dk)

pkgname='glimpse'
pkgver=3.6
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc='Fast full text search and indexing with approximate matching'
url='http://webglimpse.net'
license='BSD style'
depends=('glibc')
source=("ftp://ftp.cs.tu-berlin.de/pub/linux/Mirrors/sunsite.unc.edu/utils/text/glimpse-3.6.src.tgz"
        'compile.patch')
sha256sums=('77a5836c15b08ee9665f6cb936506223aa52c20896251994507e7b3970568fde'
            '27e995d061d9434e4e8309d1dc9574ecef8cd6737ae76f12125107d1499bb607')
#source[0]='http://webglimpse.net/trial/glimpse-latest.tar.gz'

_disabled_pkgver() {
  cd "${pkgname}"-*/
  local _ver="$(pwd)"
  _ver="${_ver##*/}"
  _ver="${_ver#${pkgname}-}"
  _ver="${_ver%.src}"
  echo "${_ver}"
}

prepare() {
  set -u
  cd "${pkgname}"-*/
  [ "${pkgver}" = '3.6' ] && patch --backup -p0 < "${srcdir}/compile.patch"
  ./configure --prefix='/usr'
  set +u
}


build() {
  set -u
  cd "${pkgname}"-*
  make -s # -j "$(nproc)" # Not compatible with parallel make
  set +u
}

package() {
  set -u
  cd "${pkgname}"-*
  make "prefix=${pkgdir}/usr" install
  set +u
}
