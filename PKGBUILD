pkgname=libcxxwrap-julia
pkgver=0.14.9
pkgrel=1
pkgdesc="C++ library for backing CxxWrap.jl"
arch=('x86_64')
url="https://github.com/JuliaInterop/libcxxwrap-julia"
license=('MIT')
depends=('julia')
makedepends=('cmake')
source=("https://github.com/JuliaInterop/libcxxwrap-julia/archive/v${pkgver}.tar.gz")
sha256sums=('51bf04ed809a93ea61f6901789c108e1119ff73fe6b93b0a5c4e04aa3b0016c1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake \
    -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr \
    -DJLCXX_BUILD_EXAMPLES=OFF -DJLCXX_BUILD_TESTS=OFF \
    -B build .
  cmake --build build --parallel 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR=$pkgdir cmake --build build --target install
}
