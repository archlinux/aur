# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: William Turner <willtur.will@gmail.com>

_pyname=fontMath
pkgname=python-${_pyname,,}
pkgver=0.9.1
pkgrel=1
pkgdesc='A collection of objects that implement fast font, glyph, etc. math'
arch=(any)
url="https://github.com/robotools/$_pyname"
license=(MIT)
depends=(python-fonttools)
checkdepends=(python-pytest)
makedepends=(python-setuptools-scm)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('1c5e76e135409f49b15809d0ce94dfd00850f893f86d4d6a336808dbbf292700')

build() {
	cd "$_archive"
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
