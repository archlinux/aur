# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=suil
pkgname="${_pkgname}-git"
pkgver=0.10.0.r299.9a93d3c
pkgrel=1
pkgdesc="A lightweight C library for loading and wrapping LV2 plugin UIs"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/suil/"
license=('custom:ISC')
makedepends=('subversion' 'python2' 'lv2' 'qt4' 'gtk2')
optdepends=('qt4: Qt 4.x UI wrapping support'
            'qt5-base: Qt 5.x UI wrapping support'
            'gtk2: GTK+ 2.x UI wrapping support')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}" "${_pkgname}-svn")
source=("${_pkgname}::git+http://git.drobilla.net/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=`grep "^SUIL_VERSION" wscript | cut -d "'" -f 2`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  python2 waf configure --prefix=/usr --configdir=/etc
  python2 waf
}

package() {
  cd "${srcdir}/${_pkgname}"

  python2 waf install --destdir="${pkgdir}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_svnname}/LICENSE"
}
