# Maintainer: thynkon <thynkon at protonmail dot com>
pkgname=poac
pkgver=0.9.2
pkgrel=1
pkgdesc="Package manager for C++ like Cargo for Rust"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://poac.dev"
license=('Apache')
depends=('git' 'tar' 'python-cpplint' 'clang')
makedepends=('make' 'curl' 'libgit2' 'nlohmann-json' 'pkg-config')
conflicts=('poac-devel-git' 'poac-git')
source=("$pkgname"-"$pkgver".tar.gz::https://github.com/poac-dev/poac/archive/"$pkgver".tar.gz)
sha256sums=('ac96de35709bd37b6ec55d9068fcfc637b7a6a47ad64e66df5696b18de8b5fc1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make CXX=/usr/bin/clang++ PREFIX=/usr RELEASE=1 all
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="$pkgdir/" PREFIX=/usr install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
