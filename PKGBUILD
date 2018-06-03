# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=mdbook-git
pkgver=0.1.7.r18.g2a55ff62f
pkgrel=1
pkgdesc="Create book from markdown files, like Gitbook but implemented in Rust"
url="https://github.com/rust-lang-nursery/mdBook"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('MPL2')
makedepends=('rust' 'cargo' 'git')
provides=('mdbook')
conflicts=('mdbook')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --release
}

check() {
  cd "${srcdir}/${pkgname}"
  cargo test
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 755 "target/release/mdbook" "${pkgdir}/usr/bin/mdbook"
}
	
