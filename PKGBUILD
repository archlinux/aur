# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=sord
pkgname="${_pkgname}-svn"
pkgver=0.13.0.r327
pkgrel=1
pkgdesc="A lightweight C library for storing RDF statements in memory"
arch=('i686' 'x86_64')
url="http://dev.drobilla.net/browser/sord"
license=('custom:ISC')
depends=('pcre' 'serd')
makedepends=('subversion' 'python2')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
replaces=('redlandmm-svn')
source="${_pkgname}::svn+http://svn.drobilla.net/sord/trunk"
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local rel=`grep "^SORD_VERSION" wscript | cut -d "'" -f 2`
  local ver="$(svnversion)"
  printf "%s.r%s" "${rel}" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}/${_pkgname}"

  python2 ./waf configure --prefix=/usr
  python2 waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  python2 waf install --destdir="$pkgdir"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
