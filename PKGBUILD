pkgname=libcxxwrap-julia
pkgver=0.9.2
pkgrel=1
pkgdesc="C++ library for backing CxxWrap.jl"
arch=('x86_64')
url="https://github.com/JuliaInterop/libcxxwrap-julia"
license=('MIT')
depends=('julia')
makedepends=('cmake')
source=("https://github.com/JuliaInterop/libcxxwrap-julia/archive/v${pkgver}.tar.gz")
sha256sums=('af48c3d808889fb188a13882958b228ec7a11426b8325df9f410df15e0d4be29')

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
