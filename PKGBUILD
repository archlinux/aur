# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libidn2-git
pkgver=2.3.4.r3.gecdf251
pkgrel=1
pkgdesc="An implementation of IDNA 2008 and TR46"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libidn/#libidn2"
license=('GPL' 'LGPL')
depends=('glibc' 'libunistring')
makedepends=('git' 'gengetopt' 'rsync' 'wget' 'gtk-doc' 'ruby-ronn')
provides=("libidn2=$pkgver" 'libidn2.so')
conflicts=('libidn2')
options=('staticlibs')
source=("git+https://gitlab.com/libidn/libidn2.git")
sha256sums=('SKIP')


pkgver() {
  cd "libidn2"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libidn2"

  ./bootstrap
  ./configure \
    --prefix="/usr" \
    --enable-gtk-doc
  make
}

check() {
  cd "libidn2"

  make check
}

package() {
  cd "libidn2"

  make DESTDIR="$pkgdir" install
}
