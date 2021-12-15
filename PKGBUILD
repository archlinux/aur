# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=statmake
pkgver=0.4.1
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
makedepends=(python-setuptools)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('c75ea5f00d9d8c298c99831568bf6fe351ce013cbaf93b8533086679ad94ee1f')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
