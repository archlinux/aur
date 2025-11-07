pkgname=legionaura
pkgver=1.0.1
pkgrel=1
pkgdesc="RGB keyboard lighting controller for Lenovo LOQ, Legion and IdeaPad Gaming laptops (C++17/libusb)"
arch=('x86_64')
url="https://github.com/nivedck/LegionAura"
license=('MIT')
depends=('libusb' )
makedepends=('cmake' 'gcc')
source=("https://github.com/nivedck/LegionAura/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "LegionAura-$pkgver"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "LegionAura-$pkgver/build"

  # Install binary
  install -Dm755 cli/legionaura "$pkgdir/usr/bin/legionaura"

  # Install udev rule
  install -Dm644 ../udev/10-legionaura.rules "$pkgdir/usr/lib/udev/rules.d/10-legionaura.rules"

  # Install license
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

