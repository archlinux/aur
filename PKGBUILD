# Maintainer: Mathieu Clabaut <mathieu@clabaut.net>

pkgname=automattermostatus
pkgver=0.1.8
pkgrel=1
pkgdesc='A mattermost custom status automation tool based on available wifi SSID'
arch=('x86_64')
url=https://gitlab.com/matclab/automattermostatus
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-v$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('11bafebd332c2c4d9f0003291dda029ab5425a792aeb85badb90216085a8db68')

build() {
  cd $pkgname-v$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-v$pkgver
  install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 distrib/$pkgname.desktop "$pkgdir"/etc/xdg/autostart/$pkgname.desktop
  install -Dm644 doc/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
}

# vim:set ts=2 sw=2 et:
