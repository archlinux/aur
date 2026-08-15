# Maintainer: Gabriel <horizzon3507>
pkgname=optionfiles
pkgver=0.2.4
pkgrel=1
pkgdesc='Minimal black and white terminal file manager with image previews'
arch=('x86_64')
url='https://github.com/fireflylabss/optionFiles'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('imagemagick: previews for JPEG, GIF, WebP, BMP and TIFF')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a763783e86cdffd21897da93071ef3c22f9ce63da1f280b48ae51750707914b9')

prepare() {
  cd "optionFiles-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "optionFiles-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "optionFiles-$pkgver"
  install -Dm755 target/release/optionfiles "$pkgdir/usr/bin/optionfiles"
  install -Dm755 target/release/fls         "$pkgdir/usr/bin/fls"
  install -Dm644 LICENSE                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md                  "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md               "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
