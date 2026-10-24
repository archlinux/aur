# Maintainer: horizzon3507 <148660626+horizzon3507@users.noreply.github.com>
pkgname=tend
pkgver=0.2.0_beta
pkgrel=1
pkgdesc="Tends the machine: scans dead weight, cleans safely, backs up dotfiles, and watches resources"
arch=('x86_64' 'aarch64')
url="https://github.com/horizzon3507/tend"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
provides=('tend')

_tag="v0.2.0-beta"
# pkgver cannot contain a hyphen, so it uses "_beta" while the tag keeps "v0.2.0-beta".
source=("$url/archive/refs/tags/$_tag.tar.gz")
# Replace SKIP with the real checksum when the tag is published: updpkgsums.
sha256sums=('e32bd3e1e6f54aa7b454ba8965df20ce1efaa097eee1f65f05ae284e43ba03f6')

build() {
  cd "tend-${_tag#v}"
  cargo build --release --locked
}

package() {
  cd "tend-${_tag#v}"
  install -Dm755 target/release/tend "$pkgdir/usr/bin/tend"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
