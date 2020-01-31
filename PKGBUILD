# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>
pkgname=llgl-git
_pkgname=LLGL
pkgver=r2253.d9ed15ed
pkgrel=1
pkgdesc="Low Level Graphics Library (LLGL) is a thin abstraction layer for the modern graphics APIs OpenGL, Direct3D, Vulkan, and Metal"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/LukasBanana/LLGL"
license=('LICENSE.txt')
#depends=()
makedepends=(
  'cmake'
  'make'
)
source=("git+https://github.com/aviallon/LLGL.git#branch=patch-linuxlib")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/$_pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make DESTDIR="$pkgdir"
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/lib/"
  cp -Rv build/build/* "$pkgdir/usr/lib/"
  cp -Rv include "$pkgdir/usr/"
  #make DESTDIR="$pkgdir" install
}
