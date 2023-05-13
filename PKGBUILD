# Maintainer: Kud Lain <kasa7qi at gmail dot com>
pkgname=ord-git
pkgver=r706.52c4d57d
pkgrel=1
epoch=
pkgdesc="an index, block explorer, and command-line wallet"
arch=('x86_64')
url="https://github.com/casey/ord"
license=('CC0-1.0')
depends=(glibc gcc-libs)
makedepends=(rust git)
provides=(ord)
source=("git+${url}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/ord"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/ord"
	cargo build --release
}

package() {
	install -Dm755 ${srcdir}/ord/target/release/ord -t "${pkgdir}/usr/bin/"
}
