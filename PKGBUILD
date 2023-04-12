# Maintainer: Mathieu Clabaut <mathieu@clabaut.net>

pkgname=automattermostatus
pkgver=0.2.2
pkgrel=1
pkgdesc='A mattermost custom status automation tool based on available wifi SSID'
arch=('x86_64')
url=https://gitlab.com/matclab/automattermostatus
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-v$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('e0f5cd08a2239c60f431c9f488cbe044ac2baa3f55fefd46e2db042aab90f094')

build() {
  cd $pkgname-v$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-v$pkgver
  install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 distrib/$pkgname.desktop "$pkgdir"/etc/xdg/autostart/$pkgname.desktop
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 config.toml.example "$pkgdir"/usr/share/doc/$pkgname/config.toml.example.md
  install -Dm644 distrib/$pkgname.service "$pkgdir"/usr/share/doc/$pkgname/$pkgname.service
  install -Dm644 doc/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
}

# vim:set ts=2 sw=2 et:
