# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=statmake
pkgver=0.5.0
pkgrel=1
pkgdesc='Dump, merge and compile Visual TrueType data in UFO3 with FontTools'
arch=(any)
url="https://github.com/daltonmaag/$pkgname"
license=(MIT)
_py_deps=(attrs
          cattrs
          fonttools
          fs) # optdepends of fonttools required for [ufo]
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer}
             python-poetry
             python-wheel)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('67ac5de8bdea62ffd57b5c714b5f8af51016d07b203e3a4deecf6f2b0c9f9276')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
