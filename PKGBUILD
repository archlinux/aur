# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Michael Wiencek <mwtuea at gmail dot com>

pkgname=echo-icon-theme-git
_gitname=echo-project
pkgver=r389.4007669
pkgrel=9
pkgdesc="The Echo icon theme from the Fedora project (development version)."
url="https://pagure.io/echo-project"
arch=('any')
license=('CCPL')
depends=('icon-naming-utils')
makedepends=('git')
optdepends=(
  'mist-icon-theme: for inheriting missing icons'
)
conflicts=('echo-icon-theme')
provides=('echo-icon-theme')
source=('git+https://pagure.io/echo-project.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  # Use number of revisions as the version itself is too long.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}/base"
  autoreconf -vfi
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}/base"
  make prefix="${pkgdir}"/usr install
}

