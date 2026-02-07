pkgname=hisat2
pkgver=2.2.2
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
sha256sums=('d3996d7bee30e38e51beb69c44b10461a4692e686487c465f9a20e3f54b6e815')

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
