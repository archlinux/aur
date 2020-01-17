# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-pyshortcuts
_name=pyshortcuts
pkgver=1.7
pkgrel=2
pkgdesc="Create desktop shortcuts to python scripts"
arch=('any')
url="https://github.com/newville/pyshortcuts"
license=('MIT')
depends=('python-six')
makedepends=('python-setuptools')
optdepends=('python-wxpython: for GUI')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "PyShortcut.desktop")
sha256sums=('24c179b76987863000ed29ba7114ead0febebe9caead2db4a0be33fd61ffa557'
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
