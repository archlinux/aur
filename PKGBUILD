# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
pkgname=solana  
pkgver=1.6.8
pkgrel=2
pkgdesc="A fast, secure, and censorship resistant blockchain."
url="https://www.solana.com"
arch=('i686' 'x86_64')
license=('Apache')
depends=()
makedepends=("rustup")
conflicts=("solana-bin")
provides=("solana")
source=("$pkgname-$pkgver.tar.gz::https://github.com/solana-labs/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('17818f910ef4555c6f7d4b73187343ab')

prepare() {
  rustup update stable
}

build() {
  cd "$pkgname-$pkgver"
  BINS=(
    solana
    solana-bench-exchange
    solana-bench-tps
    solana-faucet
    solana-gossip
    solana-install
    solana-keygen
    solana-ledger-tool
    solana-log-analyzer
    solana-net-shaper
    solana-sys-tuner
    solana-validator
    cargo-build-bpf
    cargo-test-bpf
    solana-dos
    solana-install-init
    solana-stake-accounts
    solana-stake-monitor
    solana-stake-o-matic
    solana-test-validator
    solana-tokens
    solana-watchtower
    solana-genesis
  )
  binargs=()
  for bin in "${BINS[@]}"; do
    binargs+=(--bin "$bin")
  done
  cargo build --release "${binargs[@]}"
}

package() {
  mkdir -p $pkgdir/usr/bin
  BINS=(
    solana
    solana-bench-exchange
    solana-bench-tps
    solana-faucet
    solana-gossip
    solana-install
    solana-keygen
    solana-ledger-tool
    solana-log-analyzer
    solana-net-shaper
    solana-sys-tuner
    solana-validator
    cargo-build-bpf
    cargo-test-bpf
    solana-dos
    solana-install-init
    solana-stake-accounts
    solana-stake-monitor
    solana-stake-o-matic
    solana-test-validator
    solana-tokens
    solana-watchtower
    solana-genesis
  )
  for bin in "${BINS[@]}"; do
     install -Dm755 $srcdir/$pkgname-$pkgver/target/release/$bin $pkgdir/usr/bin
  done
}
