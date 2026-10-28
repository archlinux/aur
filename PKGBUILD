# Maintainer: AlphaJack <19962243+AlphaJack at users dot noreply dot github dot com>
pkgname=mercurio-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="Apprise-compatible Rust library, CLI and HTTP server to send notifications to 150+ services via a single URL."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/AlphaJack/mercurio"
license=('Apache-2.0')
provides=('mercurio')
conflicts=('mercurio')
options=('!strip' '!debug')
backup=('etc/mercurio/mercurio.env')
source_x86_64=("$pkgname-$pkgver-x86_64-unknown-linux-musl.tar.xz::$url/releases/download/v$pkgver/mercurio-cli-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("$pkgname-$pkgver-aarch64-unknown-linux-musl.tar.xz::$url/releases/download/v$pkgver/mercurio-cli-aarch64-unknown-linux-musl.tar.xz")
source_armv7h=("$pkgname-$pkgver-armv7-unknown-linux-musleabihf.tar.xz::$url/releases/download/v$pkgver/mercurio-cli-armv7-unknown-linux-musleabihf.tar.xz")
b2sums_x86_64=('bf16651f4e01fb557820ddaa75d3650b928d4fd79f2b9c09d5bcc7d46e9b6d84a56c8db34de5a0a05822f05de423d6cfde134ba027a23f16ed67d17777270216')
b2sums_aarch64=('681fe9c7e5e9e91661d7ac08e466e739c8c1456ec7d00bf7b6ab20e61800d9bd5e1d07a73cc24f9f6de654e3040afc05a48f4b0363dfa2e18a0944e6d87a8fc6')
b2sums_armv7h=('9977264ac477004889bbf8a6e2cb2ca8cc417ca048efd5000b86a911efbf882a35249b7956a8659d23bbd304d2a856953f020e3d90195d7543b2e4095d98ebf9')

package() {
  local target
  case "$CARCH" in
    "x86_64") target="x86_64-unknown-linux-musl" ;;
    "aarch64") target="aarch64-unknown-linux-musl" ;;
    "armv7h") target="armv7-unknown-linux-musleabihf" ;;
  esac
  cd "$srcdir/mercurio-cli-$target"
  install -Dm755 mercurio "$pkgdir/usr/bin/mercurio"
  install -Dm644 mercurio.service "$pkgdir/usr/lib/systemd/system/mercurio.service"
  install -Dm600 mercurio.env "$pkgdir/etc/mercurio/mercurio.env"
}
