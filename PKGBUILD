# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg
pkgver=0.2.73
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
commit=dbfc2ada85bfd7f20d411d41adf3e23a73ca7716
url="https://github.com/zasdfgbnm/tcg/archive/$commit.zip"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog' 'libseccomp')
makedepends=('git' 'cmake' 'boost')
source=("$url")
sha256sums=('3c0a568d040a9450240bf9277ca91e64a574f19da4ac6384db651006c515f229')

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
