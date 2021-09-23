# Maintainer: ceri <ceri@dev.null>
pkgname=apkeep
pkgver=0.6.0
pkgrel=1
pkgdesc='Tool for downloading android APK files from various sources'
url='https://github.com/EFForg/apkeep'
source=("$pkgver.tar.gz::https://github.com/EFForg/apkeep/archive/$pkgver.tar.gz")
arch=('i686' 'x86_64' 'arm' 'armv7h' 'aarch64')
license=('custom:MIT')
depends=('openssl' 'gcc-libs')
makedepends=('cargo')
sha256sums=('717b8188fa78b30d350c27a8b2b317bb45b0fb99bb634ecfc5f0b0f334d938d5')

build () {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --locked --release --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 target/release/apkeep "${pkgdir}/usr/bin/apkeep"
}
 
