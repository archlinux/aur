# Maintainer: l-koehler <lorenz.koehler@posteo.de>
pkgname=cmix
pkgver=20
pkgrel=1
pkgdesc="lossless data compression program aimed at optimizing compression ratio at the cost of high CPU/memory usage"
arch=('x86_64')
url="https://www.byronknoll.com/cmix.html"
license=('GPL-3.0-only')
options=(!debug)
depends=()
makedepends=('make')
optdepends=('tar: compress multiple files by making a tarball')
source=("$pkgname-$pkgver.tar.gz::https://github.com/byronknoll/cmix/archive/refs/tags/v$pkgver.tar.gz"
		clang21.patch)
sha256sums=(SKIP
            '50e77b7ffb8ead9b3a4d109f909830764816edf997887d30bfdcc26385b35fa1')

prepare() {
	patch -Np1 -d "${srcdir}"/"$pkgname-$pkgver" -i "${srcdir}"/clang21.patch
}

build() {
	cd "$pkgname-$pkgver"
	make CC="clang" CXX="clang++"
}

package() {
	cd "$pkgname-$pkgver"
	mkdir "$pkgdir/usr/bin" -p
	mv "./cmix" "$pkgdir/usr/bin"
}
