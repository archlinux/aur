# Maintainer: Benson Muite <benson_muite at emailplus dot org>


pkgname=python-enamlx
_pkg=enamlx
epoch=
pkgver=0.6.4
pkgrel=01
pkgdesc='Additional Qt Widgets for Enaml'
arch=(any)
url=https://github.com/frmdstryr/enamlx
license=(MIT)
depends=(python python-enaml)
depends+=(python-numpy)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-setuptools-scm'
	'python-wheel')
optdepends=()
checkdepends=()
source=("https://github.com/frmdstryr/enamlx/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8300235c9e074c031102c8412bff10d8dece9de024e00cd2a8008675b88a86ec')

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

