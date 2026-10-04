# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-gtime
_pkgname=gtime
pkgver=0.8.4
pkgrel=2
pkgdesc="Global time zone lookup, comparison, and management with fuzzy search"
arch=('any')
url="https://github.com/savitojs/gtime"
license=('MIT')
depends=('python' 'python-pytz' 'python-tzlocal' 'python-fuzzywuzzy' 'python-tabulate')
makedepends=('python-build' 'python-installer' 'python-wheel')
_tag="v0.8.4"
_srcdir="gtime-0.8.4"
source=("$_pkgname-$pkgver.tar.gz::https://codeload.github.com/savitojs/gtime/tar.gz/refs/tags/$_tag")
sha256sums=('1ac56f7195c9a0de6a40a086427c1330325b6dec65265c73cbef1bbfb6b65da6')

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$_pkgname/CHANGELOG.md"
	install -Dm644 SECURITY.md "$pkgdir/usr/share/doc/$_pkgname/SECURITY.md"
	install -Dm644 assets/demo.gif "$pkgdir/usr/share/doc/$_pkgname/demo.gif"
	install -Dm644 assets/widget-screenshot.png "$pkgdir/usr/share/doc/$_pkgname/widget-screenshot.png"
	install -Dm644 gtime/widget-azclock-sidebar.dconf "$pkgdir/usr/share/$_pkgname/widget-azclock-sidebar.dconf"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	fi
}
