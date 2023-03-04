# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Robbert van der Helm <mail@robbertvanderhelm.nl>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=clap-validator
pkgver=0.3.1
pkgrel=1
pkgdesc='An automatic CLAP validation and testing tool'
arch=(aarch64 x86_64)
url='https://github.com/free-audio/clap-validator'
license=(MIT)
groups=(pro-audio)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/free-audio/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7e2aeb58b78e926875b94f4ed474acd17b282ed237c39ef3c625186aabd645f1')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd $pkgname-$pkgver
  install -vDm755 target/release/$pkgname -t "$pkgdir"/usr/bin
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
