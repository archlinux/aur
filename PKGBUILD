# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=upi
pkgver=0.1.3
pkgrel=2
pkgdesc="A simple, lightweight Rust daemon that monitors URLs and triggers local scripts when content changes."
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/upi"
license=('MIT')
install=upi.install
depends=('gcc-libs' 'glibc')
provides=('upi')
conflicts=('upi')
backup=('etc/upi/config.yml')

source=('upi.service' 'LICENSE' 'config.yml')
source_x86_64=("upi::$url/releases/download/v$pkgver/upi-linux-x86_64")
source_aarch64=("upi::$url/releases/download/v$pkgver/upi-linux-aarch64")

sha256sums=('09fc6f35aff4a4e2f0197c49a56761334273e7bbe19c3d64a14130add18a296b'
            '184086b302ece79e686ac701ca404fe7a49499626c82f684dce1b820af59710c'
            '368a8c66aa63a7cef1d891dba5ee3126de1a90069474d5bad31b0235bdde4b18')
sha256sums_x86_64=('4e228de4a099f4f92b78d66f2e36a87d9613307da0ff56b078275cec0d68f713')
sha256sums_aarch64=('4e228de4a099f4f92b78d66f2e36a87d9613307da0ff56b078275cec0d68f713')

package() {
  # Binaries and Service
  install -Dm755 "$srcdir/upi" "$pkgdir/usr/bin/upi"
  install -Dm644 "$srcdir/upi.service" "$pkgdir/usr/lib/systemd/system/upi.service"
  
  # Config
  install -Dm644 "$srcdir/config.yml" "$pkgdir/etc/upi/config.yml"
  
  # License
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
