# maintainer: asitos @ https://github.com/asitos
# PKGBUILD
pkgname=haj
pkgver=0.2.8
pkgrel=1
pkgdesc="fast, quiet, beautiful package manager and tui for blahArch Linux."
arch=('x86_64')
url="https://github.com/asitos/haj"
license=('MIT')
depends=('pacman' 'libalpm.so' 'display3d')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cdfc2c68122cb1a2aa4ec62e0aeb7c326e1c2db172d9bf3ec40f2abb707766d3')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release 
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/haj" "$pkgdir/usr/bin/haj"

  # autocompletions
  install -Dm644 <( "$pkgdir/usr/bin/haj" completions fish ) \
      "$pkgdir/usr/share/fish/vendor_completions.d/haj.fish"
  install -Dm644 <( "$pkgdir/usr/bin/haj" completions zsh ) \
      "$pkgdir/usr/share/zsh/site-functions/_haj"
  install -Dm644 <( "$pkgdir/usr/bin/haj" completions bash ) \
      "$pkgdir/usr/share/bash-completion/completions/haj"
}
