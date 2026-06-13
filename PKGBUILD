# Maintainer: Nihal Kumar <2tv8xupqg at mozmail dot com>
# https://github.com/nihalxkumar/pkgbuilds
pkgname=nu_plugin_desktop_notifications
pkgver=0.113.1
pkgrel=1
pkgdesc="A nushell plugin to send desktop notifications using notify-rust"
arch=('x86_64' 'aarch64')
url="https://github.com/fmotalleb/nu_plugin_desktop_notifications"
license=('MIT')
depends=('libnotify' 'dbus')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fmotalleb/nu_plugin_desktop_notifications/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac7ec09fe2950f76d2d7763894c034cde4919f2a282d7db267b8ba3b907e594c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --manifest-path Cargo.toml
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/nu_plugin_desktop_notifications "$pkgdir/usr/bin/nu_plugin_desktop_notifications"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

