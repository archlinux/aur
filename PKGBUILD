# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-paragrep
_pkgname=paragrep
pkgver=3.3.2
pkgrel=1
pkgdesc="grep-like tool that searches for and displays entire paragraphs matching a pattern"
arch=('any')
url="https://github.com/bmc/paragrep"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
_tag="release-$pkgver"
_srcdir="paragrep-$_tag"
source=("$_pkgname-$pkgver.tar.gz::https://codeload.github.com/bmc/paragrep/tar.gz/refs/tags/$_tag")
sha256sums=('318dc9be3312f7b3de001dc5ca1cc1fc85366205d1401f0429d8f300b5b419fc')

build() {
	cd "$_srcdir"
	rm -rf dist
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$_pkgname/CHANGELOG.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 man/paragrep.1 "$pkgdir/usr/share/man/man1/paragrep.1"
}
