# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=untrunc-git
pkgver=r30.c74920f
pkgrel=3
pkgdesc="restore a damaged (truncated) mp4, m4v, mov, 3gp video"
arch=('x86_64' 'i686')
url="https://github.com/ponchio/untrunc"
license=('GPL2')
depends=('ffmpeg' 'qt5-base')
source=("${pkgname}"::'git+https://github.com/ponchio/untrunc.git')
md5sums=(SKIP)

build() {
  cd $srcdir/$pkgname
  git submodule init
  git submodule update
  make
} 

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 $srcdir/$pkgname/untrunc $pkgdir/usr/bin/untrunc
}
