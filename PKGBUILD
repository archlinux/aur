# Maintainer: <VCalV>

pkgname=lobster-language
pkgver=2025.3
pkgrel=1
pkgdesc="Lobster programming language"
arch=('x86_64')
url="https://github.com/aardappel/lobster"
license=('Apache-2.0')
depends=('cmake' 'mesa' 'gcc')
makedepends=('git')
conflicts=('lobster')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aardappel/lobster/releases/download/v${pkgver}/lobster_linux_release.zip")
sha512sums=('9e707c506032da13bd0593ca58f91f9cd5aa2563c99730990b448de60d29abfcba37ccd6b3c8688234c045233ff47c7fdf13c47a080fecc76f6cd4571422ed54')

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
