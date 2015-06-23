# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=btag-git
epoch=1
pkgver=0.113.7fcc6ce
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
  echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
