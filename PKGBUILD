# Maintainer: MatricalDefunkt <dev <at> matricaldefunkt <dot> me>
_pypiname=e2e_cli
pkgname=e2e-cli
pkgver=0.9.30
pkgrel=1
pkgdesc="Unified command line interface to manage E2E Networks cloud services"
arch=('any')
url="https://pypi.org/project/e2e-cli/"
license=('LicenseRef-Unknown')
depends=(
	'python'
	'python-prettytable'
	'python-requests'
	'python-setuptools'
	'python-chardet'
	'python-bidict'
	'python-yaml'
	'python-jsonschema'
	'python-colorama'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pypiname:0:1}/$_pypiname/$_pypiname-$pkgver.tar.gz"
        "LICENSE-NOTICE")
sha256sums=('3465450d78d70d310e3354f21f1aa436fbdc42c68096d66eb7a5da1d0c5eb6ce'
            'a9343bba59d9a3cabd1bf4f2d4d2c1faaaff316844343986f1b1d68ed6092af4')

build() {
	cd "$_pypiname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pypiname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 e2e_cli/docs/e2e_cli.1 "$pkgdir/usr/share/man/man1/e2e_cli.1"
	install -Dm644 "$srcdir/LICENSE-NOTICE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-NOTICE"
}
