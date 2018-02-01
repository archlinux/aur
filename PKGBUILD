# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Kyle Meyer <kyle@kyleam.com>

pkgname=snakemake
pkgver=4.5.1
pkgrel=2
pkgdesc='Python-based language and execution environment for GNU Make-like workflows'
arch=(any)
url='https://snakemake.readthedocs.io'
depends=(
	python python-requests python-wrapt python-ratelimiter
	python-configargparse python-yaml python-appdirs
)
makedepends=(python-setuptools)
optdepends=(
  'graphviz: For DAG visualization'
  'python-docutils: For report generation'
)
license=(MIT)
source=("snakemake-$pkgver.tar.gz::https://bitbucket.org/snakemake/snakemake/get/v$pkgver.tar.gz")
md5sums=('da36f8c1afc926726ec50c76c55b0ce6')

prepare() {
	rm -rf "$srcdir/$pkgname-$pkgver"
	mv "$srcdir/$pkgname-$pkgname-"* "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --skip-build -O1 --root="$pkgdir"
	
	install -d "$pkgdir/etc/bash_completion.d"
	"$pkgdir/usr/bin/snakemake" --bash-completion >"$pkgdir/etc/bash_completion.d/snakemake"
}
