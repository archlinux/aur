pkgname=libcxxwrap-julia
pkgver=0.9.1
pkgrel=1
pkgdesc="C++ library for backing CxxWrap.jl"
arch=('x86_64')
url="https://github.com/JuliaInterop/libcxxwrap-julia"
license=('MIT')
depends=('julia')
makedepends=('cmake')
source=("https://github.com/JuliaInterop/libcxxwrap-julia/archive/v${pkgver}.tar.gz")
sha256sums=('d7938d88ae2dbcc6abf505df3ac280dcd7c85fca0954af56911cf510d6161e05')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  curl -L https://github.com/JuliaInterop/libcxxwrap-julia/commit/202e2a09.patch | patch -p1
}

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
