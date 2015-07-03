# Maintainer: Dylan <wizard@psilly.com>

pkgname='psillyd'
_gitname='psilly-server'
pkgver='0.0.1'
pkgrel=1
pkgdesc='Psilly game server'
arch=('any')
url='https://github.com/acerix/psilly-server'
license=('MIT')
makedepends=('cargo-bin' 'rust')
install=psillyd.install
source=(
  "$url/archive/$pkgver.tar.gz"
  psillyd.install
)
sha256sums=('SKIP'
            '23ee0bd7eb12a27affc9e3b709aa8d90549181fdb62b77c11b77b02c468119a1')

build() {
  cd "$_gitname-$pkgver"
  cargo build --release
}

package() {
  backup=("etc/$pkgname.toml")
  cd "$_gitname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "examples/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "examples/$pkgname.toml" "$pkgdir/etc/$pkgname.toml"
}

