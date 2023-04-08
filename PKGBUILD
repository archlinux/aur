# Maintainer: absrdspc <repom2@riseup.net>

pkgname=unarc-git
pkgver=r1.adc333d
pkgrel=1
pkgdesc="Unpacker for ArC (FreeArc) archives ('ArC\1' header)"
arch=('x86_64' 'i686')
url="https://github.com/xredor/unarc"
license=('unknown')
depends=('gcc-libs' 'glibc')
makedepends=('gcc' 'git')
provides=('unarc')

_gitname="unarc-git"
source=("$_gitname::git+https://github.com/xredor/unarc.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  local _mf="$srcdir/$_gitname/Makefile"
  if [ "$CARCH" != "x86_64" ]; then
    sed -i 's/-DFREEARC_64BIT//g' "$_mf"
  fi
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 -t "$pkgdir/usr/bin" 'unarc'
}
