# Maintainer: David Vernet <void@manifault.com>
pkgname=blazesym
pkgver=0.2.0_alpha.8
pkgrel=1
pkgdesc="Blazing fast address symbolization"
arch=('x86_64')
url="https://github.com/libbpf/blazesym"
license=('BSD')
groups=('linux-tools')
depends=('glibc' 'libelf' 'zlib' 'rust')
makedepends=('cargo' 'git')
source=("https://github.com/libbpf/$pkgname/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('22ffbfbeaf5579175d6da882c1dec41024213b0c84571935510c2e39b3ea53a2')

build() {
	cd "${srcdir}/${pkgname}-${pkgver//_/-}"
	cargo build --release
	cd -
}

package() {
	install -d "${pkgdir}/usr/lib"
	cp "${srcdir}/${pkgname}-${pkgver//_/-}/target/release/lib${pkgname}.so" ${pkgdir}/usr/lib/
	cp "${srcdir}/${pkgname}-${pkgver//_/-}/target/release/lib${pkgname}.a" ${pkgdir}/usr/lib/
}
