pkgname=hisat2
pkgver=2.2.1
pkgrel=3
pkgdesc='A fast and sensitive alignment program for mapping next-generation sequencing reads against genomes'
url="https://daehwankimlab.github.io/$pkgname"
license=(GPL-3.0-only)
arch=(x86_64)
optdepends=(
	'perl: To use the `hisat2` wrapper script'
	'python: To use the `hisat2-{build,build-new,inspect}` scripts'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaehwanKimLab/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3f4f867d0a6b1f880d64efc19deaa5788c62050e0a4d614ce98b3492f702599')

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
