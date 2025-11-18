# Maintainer: Xubai Wang 18016038327@189.cn
# shellcheck disable=SC2034,SC2164

_pkgname=wuwa-downloader
pkgname="$_pkgname-git"
pkgver=0.2.0.r14.gc1ef7f1
pkgrel=1
pkgdesc='Rust-powered Wuthering Waves downloader with multi-CDN support, checksum verification, and real-time progress tracking.'
url='https://github.com/yuhkix/wuwa-downloader'
arch=('x86_64')
license=('MIT')
provides=('wuwa-downloader')
conflicts=('wuwa-downloader')
depends=('openssl')
makedepends=('cargo')

source=('git+https://github.com/yuhkix/wuwa-downloader.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
