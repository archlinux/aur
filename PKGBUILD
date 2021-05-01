# Maintainer: tcg <aur-tcg@emailaddress.biz>

pkgname=tcg
pkgver=0.2.70
pkgrel=1
pkgdesc="cgroups for terminals"
arch=('x86_64')
commit=9396f428693d76e1eda0de81caed728c460470c1
url="https://github.com/zasdfgbnm/tcg/archive/$commit.zip"
license=('MIT')
depends=('boost-libs' 'fmt' 'spdlog' 'libseccomp')
makedepends=('git' 'cmake' 'boost')
source=("$url")
sha256sums=('2bd1081f630da199f7ba9e5e7c8f6f6cd0cb177714be98c60a63b25a32c1f665')

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
