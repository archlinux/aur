# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: archdaemon

pkgname=untrunc-git
pkgver=r31.07be275
pkgrel=1
pkgdesc="restore a damaged (truncated) mp4, m4v, mov, 3gp video"
arch=('x86_64' 'i686')
url="https://github.com/ponchio/untrunc"
license=('GPL2')
depends=('ffmpeg' 'qt5-base')
source=("${pkgname}"::'git+https://github.com/ponchio/untrunc.git' 'framealloc.patch')
md5sums=('SKIP'
         '7f6cf1762cd93f4ce84cb218ab856ea3')

build() {
  cd $srcdir/$pkgname
  git submodule init
  git submodule update
  patch -p1 -i $srcdir/framealloc.patch
  make
} 

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 $srcdir/$pkgname/untrunc $pkgdir/usr/bin/untrunc
}
