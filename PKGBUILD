# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: gkmcd <g@dramati.cc>

pkgname=python-pyscaffold
pkgver=4.1
pkgrel=1
pkgdesc="Python project template generator with batteries included"
url="https://pyscaffold.org/"
arch=('any')
license=('MIT')
depends=(
	'python-appdirs>=1.4.4'
	'python-appdirs<2'
	'python-configupdater>=3.0'
	'python-configupdater<4'
	'python-tomlkit>=0.7.0'
	'python-tomlkit<2'
	'python-packaging>=20.7')
optdepends=(
	'python-django: Scaffold Django projects.'
	'python-cookiecutter: Create custom scaffold templates.'
	'python-pre-commit: Use Git pre-commit hooks.'
	'python-sphinx: Support building documentation with Sphinx.'
	'python-pytest: Use the integrated unit testing.'
	'python-pytest-runner: Use the integrated unit testing.'
	'python-pytest-cov: Generate a coverage report for your project.')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
# checkdepends=('python-pytest-runner')
source=("$pkgname::git+https://github.com/pyscaffold/pyscaffold/#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	python setup.py build
}

# check() {
# 	cd "$pkgname"
# 	python setup.py pytest --addopts '-c /dev/null'
# }

package_python-pyscaffold() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
