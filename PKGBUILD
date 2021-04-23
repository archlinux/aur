# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d> 
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=libseexpr2
_fragment="#tag=v2.11"
pkgver=2.11
pkgrel=1
pkgdesc="An embeddable expression evaluation engine (main library only)"
arch=('i686' 'x86_64')
url="http://www.disneyanimation.com/technology/seexpr.html"
license=('custom:Apache')
depends=('gcc-libs')
makedepends=('libpng' 'cmake' 'git')
provides=("libSeExpr.so=${pkgver}")
conflicts=('seexpr' 'seexpr1' 'seexpr1-2' 'seexpr2')
source=("git+https://github.com/wdas/SeExpr.git${_fragment}")
md5sums=('SKIP')

prepare() {
  cd SeExpr
  sed -i '/SeExprEditor/d' CMakeLists.txt
  sed -i '/src\/demos/d' CMakeLists.txt
  sed -i '/src\/tests/d' CMakeLists.txt
  sed -i '/src\/doc/d' CMakeLists.txt
}

build() {
  cd SeExpr
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_INSTALL_LIBDIR='/usr/lib' ..
  make
}

package() {
  cd SeExpr/build
  make DESTDIR="${pkgdir}/" install

  install -D -m644 ../LICENSE \
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
