# Maintainer: DetMittens
# Based on PKGBUILD Maintained by: Ondrej Jirman <megous@megous.com>

pkgname=megatools-git
pkgver=1.10.1.r47.g1ea525e
pkgrel=1
pkgdesc="Command line client application for Mega.nz"
arch=('i686' 'x86_64' 'armv7h')
url="http://megatools.megous.com"
license=('GPL')
depends=('curl' 'glib2')
provides=('megatools')
conflicts=('megatools')
makedepends=('asciidoc' 'docbook-xml' 'autoconf' 'libtool' 'automake')
source=("git+https://github.com/megous/megatools.git")
options=(!libtool)
sha256sums=('SKIP')

pkgver() {
  cd "megatools"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
  cd "megatools"
  ./autogen.sh --prefix=/usr
}

build() {
  cd "megatools"
  make -C docs
  make
}

package() {
  cd "megatools"

  make install DESTDIR="${pkgdir}"
}
