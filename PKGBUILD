pkgname=rpclib-git
pkgver=r524.3b00c4c
pkgrel=1
pkgdesc="c++ msgpack-rpc server and client library"
arch=(any)
license=(mit)
makedepends=(git cmake make)
depends=()
provides=(rpclib)
source=("git://github.com/rpclib/rpclib")
url="http://rpclib.net/"
md5sums=(SKIP)

pkgver() {
  # from https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
  cd rpclib &&
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # instructions from http://rpclib.net/compiling/
  cd rpclib &&
  mkdir -p build &&
  cd build &&
  cmake .. &&
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" --build . &&
  make install &&
  sed s#$pkgdir##g -i "$pkgdir/usr/lib/pkgconfig/rpclib.pc"
}
