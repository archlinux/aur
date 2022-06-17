# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=statmake
pkgver=0.5.1
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
sha256sums=('859774c4906c77c020a21d83d5cf4d81e3642d47671200b648cb404702773ace')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
