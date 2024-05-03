# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=cruft
pkgver=2.15.0
pkgrel=2
pkgdesc='Maintain all the necessary boilerplate for packaging and building projects separate from the code you intentionally write. Fully compatible with existing Cookiecutter templates'
arch=('any')
url='https://cruft.github.io/cruft/'
license=('MIT')
depends=('python'
				 'python-click'
				 'python-cookiecutter'
				 'python-gitpython'
				 'python-typer')
optdepends=('python-toml: specify patterns to ignore in toml files')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('312b0312ad460dd70ea8d55d1664e2819e47d728')
sha256sums=('9802af66037418655e7e4b6f30b531591e0761939b3ff5dd45d27c3a3f588abe')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 noet:
