# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xmlto-git
pkgver=0.0.29.r8.g57b9f20
pkgrel=1
pkgdesc="Convert XML files to various formats"
arch=('i686' 'x86_64')
url="https://codeberg.org/xmlto/xmlto"
license=('GPL-2.0-or-later')
depends=('glibc' 'libxslt')
makedepends=('git' 'docbook-xsl')
provides=("xmlto=$pkgver")
conflicts=('xmlto')
source=("git+https://codeberg.org/xmlto/xmlto.git")
sha256sums=('SKIP')


pkgver() {
  cd "xmlto"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
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

  #make check
}

package() {
  cd "xmlto"

  make DESTDIR="$pkgdir" install
}
