# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xmlto-git
pkgver=r85.gb128bdc
pkgrel=1
pkgdesc="Convert XML files to various formats"
arch=('i686' 'x86_64')
url="https://pagure.io/xmlto/"
license=('GPL')
depends=('glibc' 'libxslt')
makedepends=('git' 'docbook-xsl')
provides=('xmlto')
conflicts=('xmlto')
source=("git+https://pagure.io/xmlto.git")
sha256sums=('SKIP')


pkgver() {
  cd "xmlto"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "xmlto"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "xmlto"

  make check
}

package() {
  cd "xmlto"

  make DESTDIR="$pkgdir" install
}
