# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=inlyne
pkgver=0.4.0
pkgrel=1
pkgdesc='A GPU powered yet browserless tool to help you quickly view markdown files in the blink of an eye'
arch=(x86_64)
url="https://github.com/trimental/$pkgname"
license=(MIT)
depends=(fontconfig gcc-libs freetype2 libxcursor libxi libxrandr oniguruma openssl)
makedepends=(cargo libxcb libxkbcommon wayland)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4c33a4cd1310524c073ed1b0dbf3ab5a9431d1ab43a64963932dc3464ccab7a82f3e6d5321d2e77b08a70725f484e2026c9bfb560e3b4e5e7ec48da2db5a2714')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTONIG_SYSTEM_LIBONIG=yes cargo build --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTONIG_SYSTEM_LIBONIG=yes cargo test --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Generate and install completions
  install -Dm644 "completions/inlyne.bash" "${pkgdir}/usr/share/bash-completion/completions/inlyne.bash"
  install -Dm644 "completions/inlyne.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/inlyne.fish"
  install -Dm644 "completions/_inlyne"  "${pkgdir}/usr/share/zsh/site-functions/_inlyne"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
