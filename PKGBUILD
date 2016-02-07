# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mda-lv2
pkgname="${_pkgname}-git"
pkgver=1.2.2.r177.c6cbb4e
pkgrel=1
pkgdesc="A port of the MDA VST plugins to the LV2 format"
arch=("i686" "x86_64")
url="http://drobilla.net/software/mda-lv2/"
license=("GPL2")
groups=('lv2-plugins')
depends=('lv2')
makedepends=('git' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-svn")
source=("${_pkgname}::git+http://git.drobilla.net/mda.lv2.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=`grep "^MDA_VERSION" wscript | cut -d "'" -f 2`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  python ./waf configure --prefix="/usr"
  python ./waf build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python ./waf install --destdir="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
