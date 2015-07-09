# Maintainer: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Amr Hassan <amr.hassan@gmail.com>
# Contributor: Michael Herold <arch@michaeljherold.com>
# Contributor: Ryan Marcus <ryan@rmarcus.info>

pkgname=cargo-bin
pkgrel=1
pkgver=20150709
pkgdesc="Cargo downloads your Rust project's dependencies and compiles your project."
url="http://crates.io/"
provides=('cargo')
arch=('x86_64' 'i686')
license=('APACHE' 'MIT')
depends=('gcc-libs' 'zlib')
optdepends=('rust: for rustc')
makedepends=()
conflicts=('cargo-git')
replaces=('cargo-git')
backup=()
install=''
source=("https://static.rust-lang.org/cargo-dist/cargo-nightly-${CARCH}-unknown-linux-gnu.tar.gz")
md5sums=('SKIP')

pkgver() {
  date +%G%m%d
}

package() {
  cd "${srcdir}/cargo-nightly-${CARCH}-unknown-linux-gnu/"

  install -D -m644 cargo/etc/bash_completion.d/cargo "$pkgdir/etc/bash_completion.d/cargo"
  install -D -m644 cargo/share/zsh/site-functions/_cargo "$pkgdir/usr/share/zsh/site-functions/_cargo"
  install -D -m644 cargo/share/man/man1/cargo.1 "$pkgdir/usr/share/man/man1/cargo.1"
  install -D -m644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  install -Dm 0755 cargo/bin/cargo "${pkgdir}/usr/bin/cargo"
}

# vim:set ts=2 sw=2 et:
