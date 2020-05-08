# Maintainer: Hildigerr Vergaray <Maintainer at YmirSystems dot com>
# Contributor: John Jenkins <twodopeshaggy at gmail dot com>

pkgname=btag-git
pkgver=1.4.1
pkgrel=2
pkgdesc="A command line based audio file tagger"
arch=('i686' 'x86_64')
url="https://github.com/fernandotcl/btag"
license=('GPL')
depends=('libcue' 'taglib' 'libedit')
makedepends=('git' 'cmake' 'pkg-config' 'boost')
provides=("${pkgname%-git}")

source=(
    "${pkgname%-git}::git+${url}"
)

sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --dirty | sed 's/release-//'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  mkdir 'build'
  cd 'build'
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}/build"
  make "DESTDIR=${pkgdir}" install
}
