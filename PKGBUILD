pkgname=zig-git
provides=(zig)
conflicts=(zig)
pkgver=r747.2ed949a
pkgrel=1
pkgdesc="System programming language intended to replace C"
arch=('i686' 'x86_64')
url="http://ziglang.org/"
license=('MIT')
depends=(llvm clang)
makedepends=(cmake)
source=("${provides}::git+git://github.com/andrewrk/zig.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$provides"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build()
{
    cd "$srcdir/$provides"

    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package()
{
    cd "$srcdir/$provides/build"
    make DESTDIR="$pkgdir" install
}