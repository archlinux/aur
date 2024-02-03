# Maintainer: thynkon <thynkon at protonmail dot com>
pkgname=poac
pkgver=0.9.3
pkgrel=1
pkgdesc="Package manager for C++ like Cargo for Rust"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://poac.dev"
license=('Apache')
depends=('git' 'tar' 'python-cpplint' 'clang')
makedepends=('make' 'curl' 'libgit2' 'nlohmann-json' 'pkg-config' 'onetbb')
conflicts=('poac-devel-git' 'poac-git')
source=("$pkgname"-"$pkgver".tar.gz::https://github.com/poac-dev/poac/archive/"$pkgver".tar.gz)
sha256sums=('122aa46923e3e93235305b726617df7df747ed7a26072ccd6b87ffaf84a33aed')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make CXX=/usr/bin/clang++ PREFIX=/usr RELEASE=1 all
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="$pkgdir/" PREFIX=/usr install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
