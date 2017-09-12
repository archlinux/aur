# Maintainer: Bryan Gilbert <gilbertw1 at gmail dot com>
pkgname=drop
pkgver=0.2.4
pkgrel=1
pkgdesc="A simple screenshot, screencast, and file upload tool with S3 support"
arch=('i686' 'x86_64')
url="https://github.com/gilbertw1/drop"
license=('GPL')
depends=('s3cmd' 'xsel' 'slop' 'imagemagick' 'ffmpeg')
makedepends=('cargo')
source=("https://github.com/gilbertw1/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('39cb3113792e611e1d18037bce068f2e3c39efd4aa2b992517600343b15ba379')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/drop" "$pkgdir/usr/bin/drop"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/drop/README.md"
  install -Dm644 "license" "$pkgdir/usr/share/doc/drop/license"
  install -Dm644 "doc/drop.1" "$pkgdir/usr/share/man/man1/drop.1"
}
