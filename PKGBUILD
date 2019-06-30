# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=mdbook-git
pkgver=0.2.2.r25.g1052ee92e
pkgrel=1
pkgdesc="Create book from markdown files, like Gitbook but implemented in Rust"
url="https://github.com/rust-lang-nursery/mdBook"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(MPL2)
makedepends=(rust cargo git)
provides=(mdbook)
conflicts=(mdbook)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "mdBook"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "mdBook"
  cargo build --release
}

check() {
  cd "mdBook"
  cargo test
}

package() {
  cd "mdBook"
  install -Dm 755 "target/release/mdbook" "${pkgdir}/usr/bin/mdbook"
}
	
