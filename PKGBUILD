pkgname=libcxxwrap-julia
pkgver=0.8.3
pkgrel=1
pkgdesc="C++ library for backing CxxWrap.jl"
arch=('x86_64')
url="https://github.com/JuliaInterop/libcxxwrap-julia"
license=('MIT')
depends=('julia')
makedepends=('cmake')
source=("https://github.com/JuliaInterop/libcxxwrap-julia/archive/v${pkgver}.tar.gz")
sha256sums=('b0421d11bdee5ce8af4922de6dfe3b0e5d69b07bb52894e3a22a477bbd27ee9e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  curl -L https://github.com/JuliaInterop/libcxxwrap-julia/pull/86.patch | patch -p1
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
