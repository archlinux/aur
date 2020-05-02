# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>

pkgname=cava_cmmk-git
_pkgname=cava_cmmk
pkgver=12.584920f
pkgrel=1
pkgdesc='Audio visualizer for Cooler Master keyboards.'
arch=('any')
url='https://github.com/Bonnee/cava_cmmk'
license=('GPL3')
depends=('libcmmk-git' 'cava')
makedepends=('git')
source=("git+https://github.com/Bonnee/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  # use, if no version string provided neither in sources nor in git describe:
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)

  # if s tag exists, use this
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" install
}

