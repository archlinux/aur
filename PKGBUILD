# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-ufonormalizer
_pyname=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
pkgdesc='A tool that will normalize XML and other data inside of a UFO'
arch=(any)
url="https://github.com/unified-font-object/ufoNormalizer"
license=(BSD)
depends=(python)
makedepends=(python-setuptools-scm)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('adb77deef88b8c1e13556c72d04d49f829ea978674380a963c7a76f236c58470')

prepare() {
	cd "$_archive"
	# Upstream Issue: https://github.com/unified-font-object/ufoNormalizer/issues/87
	sed -i -e 's/ "wheel",//' pyproject.toml
}

build() {
	cd "$_archive"
	export PYTHONHASHSEED=0
	python setup.py build
}

check() {
	cd "$_archive"
	python setup.py test
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
