# Maintainer: Benson Muite <benson_muite at emailplus dot org>

pkgname=python-pegen
_pkg=pegen
pkgver=0.3.0
pkgrel=1
pkgdesc='PEG parser generator for Python'
arch=('x86_64')
url='https://github.com/we-like-parsers/pegen'
license=('MIT')
depends=('python')
makedepends=(
	'python-build'
        'python-flask'
        'python-flask-wtf'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-sphinx'
        'python-sphinx-copybutton'
        'python-sphinx-furo'
	'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('8cb30cee508a95c573aa256ed2cfa80ef8f561b90264c70e7de5afc50b4ac87d')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
}

check() {
	cd "$_pkg-$pkgver"
        #pytest
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
