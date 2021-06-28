# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname=unicycler
_name=Unicycler
pkgver=0.4.9
pkgrel=1
pkgdesc="Hybrid assembly pipeline for bacterial genomes."
arch=('any')
url="https://github.com/rrwick/Unicycler/"
license=('GPL')
makedepends=('gcc' 'clang'
	'python-setuptools')
optdepends=('spades: short read or hybird assembly'
	'racon: long-read or hybrid assembly'
	'pilon: polishing'
	'samtools: polishing'
	'bowtie2: polishing'
	'blast+: rotating circular contigs')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('abb4da1c1b1795b9eae6edcde875c63e196070a53882ef42b3ece25806f0811c9c934438ede8a912af4ce04bd57a94d39dc9edd12b0ceef01b9d61af953638f8')

build() {
	cd "$srcdir/$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
