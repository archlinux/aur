# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=ftCLI
pkgname=ftcli
pkgver=0.8.0
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
sha256sums=('76955ec319432ae6ed57a32fed3ec18495778a670fa7efe11e1f9c3f77d85754')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgbase/usr/share/licenses/$pkgname/" LICENSE
}
