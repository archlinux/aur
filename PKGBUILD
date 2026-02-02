# Maintainer: Benson Muite <benson_muite at emailplus dot org>
# Contributor: Sameer Puri <aur at purisa dot me>

pkgname=python-qt-reactor
_pkg=qt-reactor
epoch=
pkgver=0.6.1
pkgrel=00
pkgdesc='Twisted Qt Integration for Qt4 and Qt5 using qtpy'
arch=(any)
url=https://github.com/frmdstryr/qt-reactor
license=(MIT)
depends=(
	'python'
	'python-qtpy'
        'python-twisted')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-wheel')
optdepends=()
checkdepends=()
source=("https://github.com/frmdstryr/qt-reactor/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('12c0ef7266f72685cf962932eb3b7b60df98a330c7b50fee236aee7b02ad3e1a')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	local python_version="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
}

check() {
	cd "$_pkg-$pkgver"
	local python_version="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

