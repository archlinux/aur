pkgname=libcxxwrap-julia
pkgver=0.7.0
pkgrel=1
pkgdesc="C++ library for backing CxxWrap.jl"
arch=('x86_64')
url="https://github.com/JuliaInterop/libcxxwrap-julia"
license=('MIT')
depends=('julia')
makedepends=('cmake')
source=("https://github.com/JuliaInterop/libcxxwrap-julia/archive/v${pkgver}.tar.gz")
sha256sums=('78c1fe3e157cecd112c5f13d2d765fe3cf595640270c8a9bcdc0ab28b6094c37')

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
