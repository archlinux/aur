# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: William Turner <willtur.will@gmail.com>

_pyname=fontMath
pkgname=python-${_pyname,,}
pkgver=0.8.1
pkgrel=2
pkgdesc='A collection of objects that implement fast font, glyph, etc. math'
arch=(any)
url="https://github.com/robotools/$_pyname"
license=(MIT)
depends=(python-fonttools)
checkdepends=(python-pytest)
makedepends=(python-setuptools-scm)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('39d71e8b7eeb33c0ddc25e94c1ae64bf29340aeea443f4327392f2be38175f54')

build() {
	cd "$_archive"
	export PYTHONHASHSEED=0
	python setup.py build
}

check() {
	cd "$_archive"
  PYTHONPATH=Lib pytest Lib/fontMath/test
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" License.txt
}
