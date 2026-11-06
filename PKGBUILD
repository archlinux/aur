# Maintainer: Dylan Forbes <dylandforbes@gmail.com>
pkgname=slinky-bin
_pkgname=slinky
pkgver=0.1.0
pkgrel=1
pkgdesc="A utility for wrangling symbolic links on Unix systems (prebuilt binaries)"
arch=('x86_64' 'aarch64')
url="https://github.com/fictionic/slinky"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug')
_release="https://github.com/fictionic/slinky/releases/download/v$pkgver"
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.xz::$_release/$_pkgname-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.xz::$_release/$_pkgname-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('2fc511ce9fff05c6132ef1c5a1bc263abf403db52ffcff5cba10de3f561d3d60')
sha256sums_aarch64=('f9dea3937c6bb34dacb0f96003e6c82348c794d12510621ded4973a3e53e90f1')

package() {
  cd "$srcdir/$_pkgname-$CARCH-unknown-linux-gnu"

  for bin in "$_pkgname" "$_pkgname-ln"; do
    install -Dm755 "$bin" "$pkgdir/usr/bin/$bin"
    install -Dm644 "generate/$bin.1" "$pkgdir/usr/share/man/man1/$bin.1"
    install -Dm644 "generate/$bin.bash" "$pkgdir/usr/share/bash-completion/completions/$bin"
    install -Dm644 "generate/_$bin" "$pkgdir/usr/share/zsh/site-functions/_$bin"
    install -Dm644 "generate/$bin.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$bin.fish"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
