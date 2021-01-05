# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libpng-minimal-git
pkgver=1.6.29.r2.gfbff8986e
pkgrel=1
pkgdesc="The official PNG reference library"
arch=('i686' 'x86_64')
url="http://www.libpng.org/pub/png/libpng.html"
license=('Custom')
depends=('glibc' 'zlib' 'sh')
makedepends=('git')
provides=('libpng')
conflicts=('libpng')
options=('staticlibs')
source=("git+https://git.code.sf.net/p/libpng/code")
sha256sums=('SKIP')


pkgver() {
  cd "code"

  git describe --long --tags | sed 's/^libpng-//;s/master-//;s/signed-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "code"

  autoreconf -fi
  ./configure --prefix="/usr" --enable-hardware-optimizations --enable-intel-sse
  make
}

#check() {
#  cd "code"

#  make check
#}

package() {
  cd "code"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/libpng/LICENSE"
}
