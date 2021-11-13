# Maintainer: Mathieu Clabaut <mathieu@clabaut.net>

pkgname=automattermostatus
pkgver=0.1.7
pkgrel=1
pkgdesc='A mattermost custom status automation tool based on available wifi SSID'
arch=('x86_64')
url=https://gitlab.com/matclab/automattermostatus
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-v$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('8dd5f941d61ed1a93b287ad2b7d6d7f099100ba4c9e89a559278a0646937219c')

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
