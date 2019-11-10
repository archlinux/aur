# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=qrencode-git
pkgver=4.0.2.r43.g13b159f
pkgrel=1
pkgdesc="A fast and compact QR Code encoding library"
arch=('i686' 'x86_64')
url="https://fukuchi.org/works/qrencode/"
license=('LGPL')
depends=('glibc' 'libpng')
makedepends=('git' 'sdl')
provides=('qrencode')
conflicts=('qrencode')
source=("git+https://github.com/fukuchi/libqrencode.git")
sha256sums=('SKIP')


pkgver() {
  cd "libqrencode"

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/v//p}')
  _rev=$(git rev-list --count v$_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
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
