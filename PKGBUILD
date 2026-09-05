# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-tempren
_pkgname=tempren
pkgver=1.4.0
pkgrel=1
pkgdesc="Powerful file renaming utility using flexible template expressions"
arch=('any')
url="https://github.com/idle-code/tempren"
license=('GPL-3.0-or-later')
depends=('python' 'python-astunparse')
makedepends=('python-build' 'python-installer' 'python-wheel')
_tag="v1.4.0"
_srcdir="tempren-1.4.0"
source=("$_pkgname-$pkgver.tar.gz::https://codeload.github.com/idle-code/tempren/tar.gz/refs/tags/$_tag")
sha256sums=('46dcc7a0efe311eedf8f47d07dc9264d71213c848bfc2751fee02fa5bb638ea7')

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	fi
}
