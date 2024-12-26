# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=litecli
pkgver=1.13.2
pkgrel=2
pkgdesc="A command-line client for SQLite databases that has auto-completion ""\
and syntax highlighting."
url="https://github.com/dbcli/litecli"
arch=(any)
license=('BSD')
depends=(
	'python'
	'python-click'
	'python-pygments'
	'python-prompt_toolkit'
	'python-sqlparse'
	'python-configobj'
	'python-cli_helpers'
)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
provides=('litecli')
conflicts=('litecli-git')
md5sums=('4994c6352c60b3470bc0380e67ce3c1d')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
