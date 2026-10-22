# Maintainer: AlphaJack <19962243+AlphaJack at users dot noreply dot github dot com>
pkgname=mercurio-bin
pkgver=0.2.1
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
b2sums_x86_64=('6f6a23d782b73814f75a3b2f9333d0c062c45fd6141cca1661c12eabda6fb14e147d9978e035b15a8126fa4a5aa3632d761d5a9b943012fb72db99dd3841ee8e')
b2sums_aarch64=('4189caf956411d47259d35a670f6536ef95fb53d474c57ce135f68922934323fbd57fa08f8a152aaba4bb8e0f596a726bdb4164084f8dd388cad9c2ec9bfa29b')
b2sums_armv7h=('032473919a73e7abdb1a4d6acded4dde1a24e7445cd4de743f2b3b5a62347206a78c70f07d431bc14db7357b68a86d487f2ca80ed0feae004d897220adf2838e')

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
