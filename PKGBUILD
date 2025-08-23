pkgname=libcxxwrap-julia
pkgver=0.14.4
pkgrel=1
pkgdesc="C++ library for backing CxxWrap.jl"
arch=('x86_64')
url="https://github.com/JuliaInterop/libcxxwrap-julia"
license=('MIT')
depends=('julia')
makedepends=('cmake')
source=("https://github.com/JuliaInterop/libcxxwrap-julia/archive/v${pkgver}.tar.gz")
sha256sums=('40cac19b70c6bd001cb8d7f8e390f476ccce803652004b238add16fc93b35b61')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DJLCXX_BUILD_EXAMPLES=OFF -DJLCXX_BUILD_TESTS=OFF \
    .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR=$pkgdir
}
