# Maintainer: thynkon <thynkon at protonmail dot com>
pkgname=poac
pkgver=0.9.1
pkgrel=1
pkgdesc="Package manager for C++ like Cargo for Rust"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://poac.dev"
license=('Apache')
depends=('git' 'tar' 'python-cpplint' 'clang')
makedepends=('make' 'curl' 'libgit2' 'nlohmann-json' 'pkg-config')
conflicts=('poac-devel-git' 'poac-git')
source=("$pkgname"-"$pkgver".tar.gz::https://github.com/poac-dev/poac/archive/"$pkgver".tar.gz)
sha256sums=('f2e14d1e13b4a036081d7d33c283a6ffc2a8382a541ba0e9553232ccc31f507b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make CXX=/usr/bin/clang++ PREFIX=/usr RELEASE=1 all
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="$pkgdir/" PREFIX=/usr install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
