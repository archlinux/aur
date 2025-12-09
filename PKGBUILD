# Maintainer: Dimitri Sabadie <hadronized@strongly-typed-thoughts.net>

pkgname=flirt
pkgver=0.4.1
pkgrel=1
epoch=
pkgdesc=" FiLe InteRacT, the file interaction tool for your command line "
arch=('x86_64')
url="https://sr.ht/~hadronized/flirt/"
license=('BSD-3-Clause')
groups=()
depends=()
makedepends=('rust')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
noextract=()
sha256sums=('cf90e8a987d9ae2d03a785d4115c2ce0ff90c1469db26af7b82c7231ab2e7567')
validpgpkeys=('6C991AA06D7A7C28573799CEA94386A8A6252ECB')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # docs / license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
