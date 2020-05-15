# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=s3-meta
pkgver=1.0.1
pkgrel=1
pkgdesc="Gather metadata about your S3 buckets"
url="https://github.com/whitfin/s3-meta"
depends=('openssl')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d6db48f3dfc3b9955d3a810c314ecd81dd0eda23e2260c046bb88606c122c290')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd target/release
  install -Dm755 s3-meta "$pkgdir/usr/bin/s3-meta"
}