# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=qrencode-git
pkgver=4.1.1.r0.g715e29f
pkgrel=1
pkgdesc="A fast and compact QR Code encoding library"
arch=('i686' 'x86_64')
url="https://fukuchi.org/works/qrencode/"
license=('LGPL')
depends=('glibc' 'libpng')
makedepends=('git' 'sdl')
provides=("qrencode=$pkgver")
conflicts=('qrencode')
source=("git+https://github.com/fukuchi/libqrencode.git")
sha256sums=('SKIP')


pkgver() {
  cd "libqrencode"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libqrencode"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libqrencode"

  #make check
}

package() {
  cd "libqrencode"

  make DESTDIR="$pkgdir" install
}
