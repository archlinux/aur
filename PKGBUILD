# Maintainer: Polochon_street <polochonstreet at gmx dot fr>
pkgname=blissify-git
pkgver=0.1.7.r16.g054bc79
pkgrel=1
pkgdesc="A tool to analyze an MPD audio library and make smart playlists"
arch=('x86_64')
url="https://github.com/Polochon-street/blissify-rs"
license=('GPL')
depends=()
makedepends=('cargo' 'nasm' 'clang')
options=('!lto')
source=("$pkgname::git+https://github.com/Polochon-street/blissify-rs")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"

  cargo build --release --locked
}

check() {
  cd "$pkgname"

  cargo test --release --locked
}

package() {
   cd "$pkgname"
   install -Dm 755 target/release/blissify -t "${pkgdir}/usr/bin"
}
