# Maintainer: Hildigerr Vergaray <Maintainer at YmirSystems dot com>
# Contributor: John Jenkins <twodopeshaggy at gmail dot com>

pkgname=btag-git
pkgver=1.4.1
pkgrel=1
pkgdesc="A command line based audio file tagger"
arch=('i686' 'x86_64')
url="https://github.com/fernandotcl/btag"
license=('GPL')
depends=('libcue' 'taglib')
makedepends=('git' 'cmake' 'pkg-config' 'boost')
source=(
  'git+git://github.com/fernandotcl/btag.git'
)

sha256sums=(
  'SKIP'
)
_gitname="btag"

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --dirty | sed 's/release-//'
}


build() {
  cd "${srcdir}/${_gitname}"
  mkdir 'build'
  cd 'build'
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "${srcdir}/${_gitname}/build"
  make "DESTDIR=${pkgdir}" install
}
