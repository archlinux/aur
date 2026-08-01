# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Robbert van der Helm <mail@robbertvanderhelm.nl>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=clap-validator
pkgver=0.4.1
pkgrel=1
pkgdesc='An automatic CLAP validation and testing tool'
arch=(aarch64 x86_64)
url='https://github.com/free-audio/clap-validator'
license=(MIT)
groups=(pro-audio)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/free-audio/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('21edbabfd92707a730ae93b98d850dfd61aceb3aa80f5b39e7eb2e7e9e9d77c7')

prepare() {
  cd $pkgname-$pkgver
  CARGO_HOME="$srcdir"/.cargo cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

build() {
  cd $pkgname-$pkgver
  CARGO_HOME="$srcdir"/.cargo cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd $pkgname-$pkgver
  install -vDm755 target/release/$pkgname -t "$pkgdir"/usr/bin
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
