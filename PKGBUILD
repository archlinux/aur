# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=python-pyshortcuts
_name=${pkgname#python-}
pkgver=1.8.0
pkgrel=1
pkgdesc="Create desktop shortcuts to Python scripts"
arch=('any')
url="https://github.com/newville/pyshortcuts"
license=('MIT')
depends=('python-six')
makedepends=('python-setuptools')
optdepends=('python-wxpython: for GUI')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "PyShortcut.desktop")
sha256sums=('1e66467a0b7c15f42e2d616abeb2d80aa81d9e0ccca50991dc79bdb99f39d8c1'
            'c243510caaf511a17ee62c89080dfa386a9d2de36eaa937c56de5a97c228ec82')

build() {
	cd "pyshortcuts-$pkgver"
	python setup.py build
}

package() {
	cd "pyshortcuts-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	# install -Dm644 pyshortcuts/icons/ladder.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps/pyshortcuts.png"
	install -Dm644 pyshortcuts/icons/ladder.png "$pkgdir/usr/share/pixmaps/pyshortcuts.png"
	install -Dm644 "$srcdir/PyShortcut.desktop" -t "$pkgdir/usr/share/applications/"
}
