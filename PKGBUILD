# Maintainer:
# Contributor: Heavysink <winstonwu91 at gmail>
_base=csa
pkgname=lib${_base}-git
pkgver=1.22.0.r9.g7b48134
pkgrel=1
pkgdesc="Bivariate Cubic Spline approximation library + standalone utility"
arch=(i686 x86_64)
url="https://github.com/sakov/${_base}-c"
license=(BSD-2-Clause)
depends=(glibc)
makedepends=(git)
source=(git+${url}.git)
sha512sums=('SKIP')
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})

pkgver() {
  cd ${_base}-c
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_base}-c/${_base}
  export CFLAGS+=" -fPIC"
  ./configure \
    --prefix=$pkgdir/usr
  make
}

package() {
  cd ${_base}-c/${_base}
  make install
  install -Dm 644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}
