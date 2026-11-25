# maintainer: asitos @ https://github.com/asitos
# PKGBUILD
pkgname=haj
pkgver=0.3.3
pkgrel=1
pkgdesc="the beautiful, cross-distro package manager and tui."
arch=('x86_64')
url="https://github.com/asitos/haj"
license=('GPL-2.0-only')
depends=('pacman' 'libalpm.so')
optdepends=('display3d: 3d spinning shark animation in tui')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('65eba9b92e1e548ebf0726faa13e232a67fa3c499ac9e455310a8ccf1369c87a')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/haj" "$pkgdir/usr/bin/haj"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # autocompletions
  install -Dm644 <( "$pkgdir/usr/bin/haj" completions fish ) \
      "$pkgdir/usr/share/fish/vendor_completions.d/haj.fish"
  install -Dm644 <( "$pkgdir/usr/bin/haj" completions zsh ) \
      "$pkgdir/usr/share/zsh/site-functions/_haj"
  install -Dm644 <( "$pkgdir/usr/bin/haj" completions bash ) \
      "$pkgdir/usr/share/bash-completion/completions/haj"
}
