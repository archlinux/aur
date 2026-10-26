# Maintainer: AlphaJack <19962243+AlphaJack at users dot noreply dot github dot com>
pkgname=mercurio-bin
pkgver=0.2.4
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
b2sums_x86_64=('42853ee4e35382304ef22d6290aadac9789d5fc59ce3078d6dc2f17eb914192a113d2f4e1e02dd6d741c2aca6a8bc5463b67dc140f3c8e70156f985ad7c0b76d')
b2sums_aarch64=('36b41aced96ab33af5cca4a8b34582f8a2bf73158e181a866f942ed1bdc37b34e55d164c6946623f5d591e3f9837851d500023b6aeaf18149e1c0a939a0a17ed')
b2sums_armv7h=('0784e2c0d6de35161a582b8ceb487519a334da83a2d181279d30ce1a8c6b9193a2f798732d59dae2c947bac6836142a09330bcd4792facdb84c7f630180182de')

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
