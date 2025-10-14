# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-authenticator
pkgver=2.0.5
pkgrel=1
pkgdesc="A secure, command-line Time-based One-time Password (TOTP) authenticator application written in Rust. It securely stores your TOTP secrets using AES-256-GCM encryption, Argon2id for strong master key derivation and Zeroizing for cold boot attacks."
arch=('x86_64')
url="https://github.com/clauderarch/kripton-authenticator"
license=('GPL3')
depends=(glibc)
makedepends=('rust' 'git')
source=("https://github.com/clauderarch/kripton-authenticator/archive/892c4a1d87facf94adbcbf7bde2bdd9ac25203a0.tar.gz"
        "kripton-authenticator.desktop"
        "kripton-auth-logo.png")
sha256sums=('182864135377c6d6a8fee3c28bfa5c9df320401f45550127111782e3842881f0' 
            '5c9cfee8d758686dc2426284b7b9ebb08a4fc5ae20fbfe647a5d69c25d546c70'
            'a04b394125d96dcbc94935cebcd5f26d4ad3f64b0ca8e41f7a437690422882c3')

_pkgname_dir="${pkgname}-892c4a1d87facf94adbcbf7bde2bdd9ac25203a0"

build() {
  cd "$srcdir/$_pkgname_dir"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname_dir"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/kripton-authenticator.desktop" "$pkgdir/usr/share/applications/kripton-authenticator.desktop"
  install -Dm644 "$srcdir/kripton-auth-logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
