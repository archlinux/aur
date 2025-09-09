# Maintainer: Kim Scarborough <kim@scarborough.kim>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-anyascii
pkgver=0.3.3
pkgrel=1
pkgdesc='Unicode to ASCII transliteration'
arch=('any')
url='https://github.com/anyascii/anyascii'
license=('ISC')
depends=('python')
makedepends=('python-build' 'python-flit-core' 'python-installer')
checkdepends=('python-pytest')
source=("https://github.com/anyascii/anyascii/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cdd3caa392e37bed1d829343050345218a324e5ed2f5c5bd263458bcbe00d337')

build() {
	cd "$srcdir/anyascii-$pkgver/impl/python"
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd "$srcdir/anyascii-$pkgver/impl/python"
	python -m pytest
}

package() {
	cd "$srcdir/anyascii-$pkgver/impl/python"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/anyascii-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
