# maintainer: asitos @ https://github.com/asitos
# PKGBUILD
pkgname=haj
pkgver=0.2.9
pkgrel=1
pkgdesc="fast, quiet, beautiful package manager and tui for blahArch Linux."
arch=('x86_64')
url="https://github.com/asitos/haj"
license=('MIT')
depends=('pacman' 'libalpm.so' 'display3d')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('13052aa96574e8217624fed73835401bcef5afb716633719d8db76f5266489b5')

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
