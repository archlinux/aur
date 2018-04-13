# Maintainer: Ondrej Jirman <megous@megous.com>

pkgname=megatools-git
pkgver=1.9.98.r45.g5a48663
pkgrel=1
pkgdesc="Command line client application for Mega.nz"
arch=('i686' 'x86_64' 'armv7h')
url="http://megatools.megous.com"
license=('GPL')
depends=('curl' 'glib2')
provides=('megatools')
conflicts=('megatools')
makedepends=('asciidoc')
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
	./autogen.sh
}

build() {
  cd "megatools"

  ./configure --prefix=/usr

  make
}

package() {
  cd "megatools"

  make install DESTDIR="${pkgdir}"
}
