# Maintainer: Dylan <wizard@psilly.com>

pkgname='psillyd'
_gitname='psilly-server'
pkgver='0.0.1'
pkgrel=1
pkgdesc='Psilly game server'
arch=('any')
url='https://github.com/acerix/psilly-server'
license=('MIT')
makedepends=('rust' 'cargo-bin')
install=psillyd.install
source=(
  "$url/archive/$pkgver.tar.gz"
  psillyd.install
)
sha256sums=('03690927d2d7149cd766518920e9060264e21e874444a19af424cc73a7e9904f'
            '63e597c54751a4ef8c39d2dd769893b6329c2fc02b5ad253dc404cd310bab573')

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

