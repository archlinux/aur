# Maintainer: <VCalV>

pkgname=lobster-language
pkgver=2025.4
pkgrel=1
pkgdesc="Lobster programming language"
arch=('x86_64')
url="https://github.com/aardappel/lobster"
license=('Apache-2.0')
depends=('cmake' 'mesa' 'gcc')
makedepends=('git')
conflicts=('lobster' 'lobster-language-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aardappel/lobster/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8f6401e3d255ff13461487ab43cfdff8988918e77d81ebef1f50348c910dcbcf2e0586c458121347523882185a95a4c3400140dbc430cdaaf39e78b248d6303d')

build() {
  cd "lobster-${pkgver}"
  mkdir -p build
  cd build
  cmake ../dev/ -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
  make
}

package() {
  cd "lobster-${pkgver}/build"
  make install

  # Install the LICENSE correctly
  install -Dm644 ../dev/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
