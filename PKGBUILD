# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

## 0.4.1 was never tagged, so I use the most recent commit

pkgname=python-flake8-sql
_name="${pkgname#python-}"
pkgver=0.4.1
_commit=0ed4d53dfed6d243254d9065646b17cf8f49708d
pkgrel=1
pkgdesc='Plugin that checks SQL code against opinionated style rules'
arch=('any')
url='https://github.com/pgjones/flake8-sql'
license=('MIT')
depends=('flake8' 'python-sqlparse')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
replaces=('flake8-sql')
provides=('flake8-sql')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::https://github.com/pgjones/flake8-sql/archive/$_commit.tar.gz")
sha256sums=('b4fac5b0c0c129a5ef9a863ad23c997e5b28a4a11d810493c6d38971052e253d')

build() {
	cd "$_name-$_commit"
	python setup.py build
}

check() {
	cd "$_name-$_commit"
	pytest
}

package() {
	cd "$_name-$_commit"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
