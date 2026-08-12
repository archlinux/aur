pkgname=hisat2
pkgver=2.2.3
pkgrel=1
pkgdesc='A fast and sensitive alignment program for mapping next-generation sequencing reads against genomes'
url="https://daehwankimlab.github.io/$pkgname"
license=(GPL-3.0-only)
arch=(x86_64)
optdepends=(
	'perl: To use the `hisat2` wrapper script'
	'python: To use the `hisat2-{build,build-new,inspect}` scripts'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaehwanKimLab/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b53107422e5b44ebea4b20b1a77bb9e240d6b92d654fcd7e6a6ab5d1aae86c45')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	for bin in hisat2 hisat2-*; do
		install -Dm755 $bin "$pkgdir/usr/bin/$bin"
	done
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
