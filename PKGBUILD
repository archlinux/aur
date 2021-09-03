# Maintainer: ceri <ceri@dev.null>
pkgname=apkeep
pkgver=0.5.0
pkgrel=1
pkgdesc='Tool for downloading android APK files from various sources'
url='https://github.com/EFForg/apkeep'
source=("$pkgver.tar.gz::https://github.com/EFForg/apkeep/archive/$pkgver.tar.gz")
arch=('i686' 'x86_64' 'arm' 'armv7h' 'aarch64')
license=('custom:MIT')
depends=('openssl' 'gcc-libs')
makedepends=('cargo')
sha256sums=('ab98aadf143a75eab807397d522438fd332998cbce5e614e593b81f53f76a543')

build () {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --locked --release --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 target/release/apkeep "${pkgdir}/usr/bin/apkeep"
}
 
