# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: William Turner <willtur.will@gmail.com>

_pyname=fontMath
pkgname=python-${_pyname,,}
pkgver=0.9.3
pkgrel=1
pkgdesc='A collection of objects that implement fast font, glyph, etc. math'
arch=(any)
url="https://github.com/robotools/$_pyname"
license=(MIT)
depends=(python-fonttools)
checkdepends=(python-pytest)
makedepends=(python-{build,installer}
              python-setuptools-scm
              python-wheel)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('6a5387cb7feb105958db2f5ceedc878513cc35bf3715e262090f0557be0c1b1c')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH=Lib pytest Lib/fontMath/test
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" License.txt
}
