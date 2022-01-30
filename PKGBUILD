# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=python-pyshortcuts
pkgver=1.8.1
pkgrel=1
pkgdesc="Create desktop shortcuts to Python scripts"
arch=('any')
url="https://github.com/newville/pyshortcuts"
license=('MIT')
depends=('python')
makedepends=(
	'python-setuptools-scm'
	'python-build'
	'python-install'
	'python-wheel')
optdepends=('python-wxpython: for GUI')
source=(
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pyshortcuts/pyshortcuts-$pkgver.tar.gz"
	"PyShortcut.desktop")
sha256sums=('5791056a57f5dc71225afa99838c13354ba00d05568f0e069bb59c2376cc6701'
            'c243510caaf511a17ee62c89080dfa386a9d2de36eaa937c56de5a97c228ec82')

build() {
	cd "pyshortcuts-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
	# python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "pyshortcuts-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	# python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	# install -Dm644 pyshortcuts/icons/ladder.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps/pyshortcuts.png"
	install -Dm644 pyshortcuts/icons/ladder.png "$pkgdir/usr/share/pixmaps/pyshortcuts.png"
	install -Dm644 "$srcdir/PyShortcut.desktop" -t "$pkgdir/usr/share/applications/"
}
