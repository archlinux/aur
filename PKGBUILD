# Maintainer: gbr <gbr@protonmail.com>
_pkgname=Myxer
pkgname=myxer
pkgver=1.2.1
pkgrel=2
pkgdesc='A modern volume mixer for PulseAudio'
arch=('x86_64')
url='https://github.com/Aurailus/Myxer'
license=('GPL3')
depends=('gtk3' 'pulseaudio')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('e7239a5e2c782bff4ce28d1bafbc2c48d723648150ddb4bfa77c9754a7cf1c0c7a6d47ead82787148087e13c06c339a2e4436eb968e63ea79261a3325b0d9f85')

prepare() {
  # https://github.com/VixenUtils/Myxer/pull/20
  cd "$_pkgname-$pkgver"
  sed -i '/^version = ""$/c version = "0.9.1"' Cargo.toml
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --locked --release
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --locked --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
