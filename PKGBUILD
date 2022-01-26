#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=unicycler
_name=Unicycler
pkgver=0.5.0
pkgrel=1
pkgdesc="Hybrid assembly pipeline for bacterial genomes."
arch=('any')
url="https://github.com/rrwick/Unicycler/"
license=('GPL')
makedepends=(
	'gcc'
	'clang'
	'python-setuptools'
)
optdepends=(
	'spades: short read or hybird assembly'
	'racon: long-read or hybrid assembly'
	'pilon: polishing'
	'samtools: polishing'
	'bowtie2: polishing'
	'blast+: rotating circular contigs'
)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7e333d2e7b855e2c914ea8488c9f81626eb3a3c9d884bbab7196598416c824c23e3eb27cb9ac3001ec82dc7576fc44558055b86fe3d3c6bdf5d8afaf2592236d')

build() {
	cd "$srcdir/$_name-$pkgver" || exit
	export PYTHONHASHSEED=0
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver" || exit
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
