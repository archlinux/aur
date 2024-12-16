# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pandoc-include
pkgname=python-$_pipname
pkgver=1.4.1
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
sha256sums=('dc940f91b05de6daf87e1f411f897d543f7e07bdb5a127596bf25d4a1035a742')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" LICENSE
}
