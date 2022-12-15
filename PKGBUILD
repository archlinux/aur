# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-tendo
_pkg="${pkgname#python-}"
pkgver=0.3.0
pkgrel=1
pkgdesc="Adds basic functionality not (yet) provided by Python"
arch=('any')
url="https://github.com/pycontribs/tendo"
license=('PSF')
depends=('python-six')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-setuptools-scm-git-archive'
	'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('68392d686eb6ece71c14ff0fe24340e83c4362525c8b26f144c84f3122ae9e77')

build() {
	cd "$_pkg-$pkgver"
	SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
