# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-shellkit
_pkgname=shellkit
pkgver=0.2.0_beta3
pkgrel=1
pkgdesc="Unix-like educational terminal toolkit for learning CLI internals"
arch=('any')
url="https://github.com/pokeyaro/shellkit"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
_tag="v0.2.0-beta3"
_srcdir="shellkit-0.2.0-beta3"
source=("$_pkgname-$pkgver.tar.gz::https://codeload.github.com/pokeyaro/shellkit/tar.gz/refs/tags/$_tag")
sha256sums=('1cfcb322df94c7d15cc372cac3f5cb0853f7ed5ba2cc58206b2d8eb79daeafa1')

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
