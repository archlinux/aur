# Maintainer: AlphaJack <19962243+AlphaJack at users dot noreply dot github dot com>
pkgname=mercurio-bin
pkgver=0.2.2
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
b2sums_x86_64=('aca87ba6e4066abe0560aeae13079e25abe2af52c0c834675b85f5691c74fdfdbea3bdc6b7df5531890cc18150415f159486f1509436e3acc7430bafb7f83d4c')
b2sums_aarch64=('0dcdccca7b978f50a9c92bb598b732938e598eab747ac13f7c39d5963af6c2815dc1312daef1e84481c029bae2681adc22cbe0094ab7c939b5011b7443312a13')
b2sums_armv7h=('75d958d1fc6b82b019a6054d998dc002bbf6d6b43af6952c01ea0309743522a121631af638ee8966581081b609569af53d43ad53710cf0eec553f249038aa72b')

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
