# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pandoc-include
pkgname=python-$_pipname
pkgver=1.2.1
pkgrel=1
pkgdesc='Panflute filter to allow file includes'
arch=(any)
url="https://github.com/DCsunset/$_pipname"
license=(MIT)
_py_deps=('natsort>=7'
          'panflute>=2.0.5')
depends=("${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pipname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e0c3a14e3a9ff34f23f2b27823d6d3b864453fe31f748d55cf430fb5f6eb7111')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	python -m unittest discover
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" LICENSE
}
