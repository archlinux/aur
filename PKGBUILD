# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-shallow-backup
_pkgname=shallow-backup
pkgver=6.6
pkgrel=2
pkgdesc="Git-integrated backup tool for dotfiles, packages, and app configs"
arch=('any')
url="https://github.com/alichtman/shallow-backup"
license=('MIT')
depends=('python' 'python-rich' 'python-inquirer' 'python-pyyaml')
makedepends=('python-build' 'python-installer' 'python-wheel')
_tag="v6.6"
_srcdir="shallow-backup-6.6"
source=("$_pkgname-$pkgver.tar.gz::https://codeload.github.com/alichtman/shallow-backup/tar.gz/refs/tags/$_tag")
sha256sums=('b370011004d29230860c99b4c1d76320a4bdf1e39955ebf49857957c4214c3e1')

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$_pkgname/CHANGELOG.md"
	install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$_pkgname/CONTRIBUTING.md"
	install -Dm644 CONTRIBUTORS.md "$pkgdir/usr/share/doc/$_pkgname/CONTRIBUTORS.md"
	install -d "$pkgdir/usr/share/doc/$_pkgname/docs"
	install -Dm644 docs/*.md "$pkgdir/usr/share/doc/$_pkgname/docs/"
	install -Dm644 img/shallow-backup-demo.gif "$pkgdir/usr/share/doc/$_pkgname/shallow-backup-demo.gif"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	fi
}
