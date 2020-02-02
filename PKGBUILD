# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-pyshortcuts
_name=${pkgname#python-}
pkgver=1.7.1
pkgrel=1
pkgdesc="Create desktop shortcuts to python scripts"
arch=('any')
url="https://github.com/newville/pyshortcuts"
license=('MIT')
depends=('python-six')
makedepends=('python-setuptools')
optdepends=('python-wxpython: for GUI')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        "PyShortcut.desktop")
sha256sums=('94d87302bdd8a5ea222c56d260ea9d9bd27817d97044c47c47872e7812b22e22'
            '82fa76300174a1cdaaeea9181c0292bd80cd77bc7fc896091a8110c6d294779f')

build() {
	cd "pyshortcuts-$pkgver"
	python setup.py build
}

package() {
	cd "pyshortcuts-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/PyShortcut.desktop" -t "$pkgdir/usr/share/applications"
}
