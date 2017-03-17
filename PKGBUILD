# Maintainer:  VirtualTam <virtualtam@flibidi.net>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname="raul"
pkgname="${_pkgname}-git"
pkgver=0.8.9.r553.f0f8a61
pkgrel=1
epoch=1
pkgdesc="Realtime Audio Utility Library aimed at audio and musical applications"
arch=('any')
url="http://drobilla.net/software/raul/"
license=('GPL3')
depends=()
makedepends=('git' 'python')
provides=('raul')
conflicts=('raul')
source=("${_pkgname}::git+http://git.drobilla.net/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver=`grep "^RAUL_VERSION" wscript | cut -d "'" -f 2`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build(){
  cd "${srcdir}/${_pkgname}"
  python waf configure --prefix="/usr"
  python waf build ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/${_pkgname}"
  python waf install --destdir=${pkgdir}
}
