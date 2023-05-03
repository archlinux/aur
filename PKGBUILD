# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pandoc-include
pkgname=python-$_pipname
pkgver=0.8.7
pkgrel=3
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
sha256sums=('af4a8d950713896d5f6bf4f43d51b978a8f4bef842bdd10974f4760e78db8262')

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
