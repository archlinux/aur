# Maintainer: GreenRaccoon23 <GreenRaccoon a t gmail d o t com>

pkgname=snzip
pkgver=20120803
pkgrel=1
pkgdesc="Snappy compression console utilite"
arch=(i686 x86_64)
url="https://github.com/kubo/snzip"
license=(bsd)
depends=(snappy)
makedepends=(git)

_gitroot="https://github.com/kubo/snzip.git"
_gitname="snzip"

build(){
  cd $srcdir
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname"
    git reset --hard
    git clean -dxf
    git pull 
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install DESTDIR="$pkgdir" || true
} 