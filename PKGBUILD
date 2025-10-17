# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-authenticator
pkgver=2.1.4
pkgrel=1
pkgdesc="A secure, command-line Time-based One-time Password (TOTP) authenticator application written in Rust. It securely stores your TOTP secrets using AES-256-GCM encryption, Argon2id for strong master key derivation and Zeroizing for cold boot attacks."
arch=('x86_64')
url="https://github.com/clauderarch/kripton-authenticator"
license=('GPL3')
depends=(glibc)
makedepends=('rust' 'git')
source=("https://github.com/clauderarch/kripton-authenticator/archive/cafca30235bda27399596e8673ca3f7d4d8c0d14.tar.gz"
        "kripton-authenticator.desktop"
        "kripton-auth-logo.png")
sha256sums=('c5971fe2d4557b33ce07426c2232148f55dd4ee5d195caa3cfb0db5bbd76924d' 
            '5c9cfee8d758686dc2426284b7b9ebb08a4fc5ae20fbfe647a5d69c25d546c70'
            'a04b394125d96dcbc94935cebcd5f26d4ad3f64b0ca8e41f7a437690422882c3')

_pkgname_dir="${pkgname}-cafca30235bda27399596e8673ca3f7d4d8c0d14"

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
