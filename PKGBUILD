# maintainer: asitos @ https://github.com/asitos
# PKGBUILD
pkgname=haj
pkgver=0.3.2
pkgrel=1
pkgdesc="the beautiful, cross-distro package manager and tui."
arch=('x86_64')
url="https://github.com/asitos/haj"
license=('GPL-3.0-or-later')
depends=('pacman' 'libalpm.so' 'display3d')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b28187351c3c93d0218f76684aebf544d46278f3cfe6cce43256702b1d06ff67')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
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
