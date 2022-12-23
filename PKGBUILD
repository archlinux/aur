# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Robbert van der Helm <mail@robbertvanderhelm.nl>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=clap-validator
pkgver=0.1.0
pkgrel=1
pkgdesc='An automatic CLAP validation and testing tool'
arch=(aarch64 x86_64)
url='https://github.com/free-audio/clap-validator'
license=(MIT)
groups=(pro-audio)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/free-audio/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0f146212d353f60b3220e46ea1ccaa8439b3af4f268b0b041173763dcd9d0956')

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
