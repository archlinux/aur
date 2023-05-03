# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fdiff
pkgver=3.0.0
pkgrel=3
pkgdesc='An OpenType table diff tool for fonts based on the fontTools TTX format'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=(MIT)
_py_deps=(aiodns
          aiofiles
          aiohttp
          fonttools
          rich)
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4d00db17bb5d9980d92a395ceac43559c11c35347c43a12e599123745fe67f7d')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
