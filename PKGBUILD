# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-blastradius
_pkgname=blastradius
pkgver=0.1.0+r4.ee88d07
pkgrel=1
_repo=blastradius
_commit=ee88d07e0705cef6cbda4c6d687e4bf18fb1eca3
_srcdir="$_repo-$_commit"
pkgdesc="Shows what breaks before you change a Python function: callers with file:line, transitive dependents and affected tests, using a local call graph"
arch=('any')
url="https://github.com/enhanciar/blastradius"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/enhanciar/blastradius/archive/$_commit.tar.gz")
sha256sums=('6de507881b04d623844a87f335aade2c85aaa1c25cec57356427fb07820b2ad9')

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_srcdir"
	PYTHONPATH="$PWD/src" python -m pytest tests -v
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
