# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libidn-git
pkgver=1.41.r30.g674e0fe1
pkgrel=1
pkgdesc="An implementation of the Stringprep, Punycode and IDNA 2003 specifications"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libidn/"
license=('GPL' 'LGPL')
depends=('glibc')
makedepends=('git' 'gengetopt' 'gperf' 'gtk-doc' 'fig2dev' 'ghostscript')
provides=("libidn=$pkgver")
conflicts=('libidn')
options=('staticlibs')
source=("git+https://git.savannah.gnu.org/git/libidn.git")
sha256sums=('SKIP')


pkgver() {
  cd "libidn"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libidn"

  make bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libidn"

  make check
}

package() {
  cd "libidn"

  make DESTDIR="$pkgdir" install
}
