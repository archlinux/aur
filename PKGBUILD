# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Amr Hassan <amr.hassan@gmail.com>
# Contributor: Michael Herold <arch@michaeljherold.com>
# Contributor: Ryan Marcus <ryan@rmarcus.info>

pkgname=cargo-nightly-bin
pkgver=20161126
pkgrel=1
pkgdesc="Rust package manager"
url="https://crates.io/"
conflicts=('cargo')
provides=('cargo')
arch=('x86_64' 'i686')
license=('APACHE' 'MIT')
depends=('curl' 'rust')
source_i686=("https://static.rust-lang.org/cargo-dist/cargo-nightly-i686-unknown-linux-gnu.tar.gz")
source_x86_64=("https://static.rust-lang.org/cargo-dist/cargo-nightly-x86_64-unknown-linux-gnu.tar.gz")
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')

pkgver() {
  cd "cargo-nightly-$CARCH-unknown-linux-gnu"
  cat version | sed 's/.* //;s/.$//;s/-//g'
}

package() {
  cd "cargo-nightly-$CARCH-unknown-linux-gnu"

  install -Dm644 cargo/etc/bash_completion.d/cargo "$pkgdir/etc/bash_completion.d/cargo"
  install -Dm644 cargo/share/zsh/site-functions/_cargo "$pkgdir/usr/share/zsh/site-functions/_cargo"
  install -Dm644 cargo/share/man/man1/cargo.1 "$pkgdir/usr/share/man/man1/cargo.1"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"

  install -Dm755 cargo/bin/cargo "$pkgdir/usr/bin/cargo"
}
