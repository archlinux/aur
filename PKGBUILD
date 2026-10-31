# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-csv-quality-gate
_pkgname=csv-quality-gate
pkgver=0.3.1
pkgrel=1
_repo=csv-quality-gate
_tag=v0.3.1
_srcdir="$_repo-$pkgver"
pkgdesc="Checks CSV files for missing columns, empty cells, and duplicate values using configurable profiles, with line-number evidence and pass/warn/fail exit codes"
arch=('any')
url="https://github.com/roli-lpci/csv-quality-gate"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pytest' 'python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/roli-lpci/csv-quality-gate/archive/refs/tags/$_tag.tar.gz")
sha256sums=('3fd75f7fbea824494128e2d73fcefa88f7be92fa9ecfa5ab335160e23dd0ae73')

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_srcdir"
	python -m pytest tests -v
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -d "$pkgdir/usr/share/$_pkgname/skill"
	cp -r skills/csv-quality-gate "$pkgdir/usr/share/$_pkgname/skill/"
	install -Dm644 "$srcdir/$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
