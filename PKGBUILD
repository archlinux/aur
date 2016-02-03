# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkgname=raul
pkgname="${_pkgname}-svn"
pkgver=0.8.6.r5821
pkgrel=1
pkgdesc="C++ Realtime Audio Utility Library."
arch=('any')
url="http://drobilla.net/software/raul/"
license=('GPL')
makedepends=('subversion' 'python2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::svn+http://svn.drobilla.net/lad/trunk/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local rel=$(grep "^RAUL_VERSION" wscript | cut -d "'" -f 2)
  local ver="$(svnversion)"
  printf "%s.r%s" "${rel}" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}/${_pkgname}"

  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd "${srcdir}/${_pkgname}"

  python2 waf install --destdir="${pkgdir}"
}
