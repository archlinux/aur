# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pandoc-include
pkgname=python-$_pipname
pkgver=1.4.2
pkgrel=1
pkgdesc='Panflute filter to allow file includes'
arch=(any)
url="https://github.com/DCsunset/$_pipname"
license=(MIT)
_pydeps=(natsort
          panflute)
depends=("${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pipname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('622c64e07a17e5b1cecb2f137997aba627cf07d3634dbf3de33a963bae36ff54')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" LICENSE
}
