# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg
pkgver=0.2.71
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
commit=256d45e23b4ba36addd222d04c33cf6d992b6d50
url="https://github.com/zasdfgbnm/tcg/archive/$commit.zip"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog' 'libseccomp')
makedepends=('git' 'cmake' 'boost')
source=("$url")
sha256sums=('7ffadbcf87e1fd717c050f1e4c801448a806575522c9754a34f07b402310fc65')

build() {
  cd "$srcdir/tcg-$commit"
  mkdir -p build
  cd build
  cmake -DVERSION=${pkgver} -DCMAKE_INSTALL_PREFIX=/usr ..
  make -j
}

package() {
  cd "$srcdir/tcg-$commit"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm4755 build/tcg "${pkgdir}/usr/bin/tcg"
}
