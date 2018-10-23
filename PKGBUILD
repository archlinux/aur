# Maintainer: kpcyrd <git@rxv.cc>

pkgname=sn0int
pkgver=0.3.0
pkgrel=1
pkgdesc="OSINT framework and package manager"
url="https://github.com/kpcyrd/sn0int"
depends=('libcap' 'sqlite' 'libseccomp')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('GPL3')
install='sn0int.install'
source=("https://github.com/kpcyrd/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e85de54532db39cab0d55187c42eea97fbe7f1d5b9717cbc01aa1e72ddd33c98')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  install -d "$pkgdir/usr/share/bash-completion/completions" \
             "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/sn0int" completions bash > "$pkgdir/usr/share/bash-completion/completions/sn0int"
  "$pkgdir/usr/bin/sn0int" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_sn0int"
}

# vim:set ts=2 sw=2 et:
