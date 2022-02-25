# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=ftCLI
pkgname=ftcli
pkgver=0.6.5
pkgrel=1
pkgdesc='A command line font editor'
arch=(any)
url="https://github.com/$_upname/$_upname"
license=(MIT)
_py_deps=(colorama
          click
          brotli
          fonttools
          skia-pathops
          zopfli)
depends=(dehinter
         font-line
         python
         "${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer}
             python-setuptools
             python-wheel)
_archive="$_upname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('bebabf3f8cbfe5790751608ab5f372708796c964d0393d7295a7a19ff02da772')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgbase/usr/share/licenses/$pkgname/" LICENSE
}
