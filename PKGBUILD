# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgbase='python-sqlmodel'
pkgname=('python-sqlmodel')
_module='sqlmodel'
pkgver='0.0.20'
pkgrel=1
pkgdesc="SQLModel, SQL databases in Python, designed for simplicity, compatibility, and robustness."
url="https://github.com/tiangolo/sqlmodel"
depends=(
	'python>=3.12'
	'python-pydantic'
	'python-sqlalchemy'
	'python-sqlalchemy2-stubs'
	'python-fastapi'
	'pre-commit>=2.17.0'
)
makedepends=(
	python-build
	python-installer
	python-wheel
	python-pdm-backend
)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('fcb3066bcc3892cf602457540c712dc64a94916d4b16124d050b1eedc5f1d95202b0df84b890d7161659bd6e04c54a5b102beca23adab4eeaccaf6fe204c5ab3')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	python -m installer --compile-bytecode=2 --destdir="$pkgdir" dist/*.whl
}
