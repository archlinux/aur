# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=python-zgitignore
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=2
pkgdesc="Check if a file is ignored by a .zgitignore file, compatible with .gitignore syntax"
url="https://github.com/zb3/zgitignore"
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer')
checkdepends=('python-pytest')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2e4d085114cc2c35191f1a1defee64c2ffa791b6763338c0e10ad57a25d2f0a4')

build() {
	cd "zgitignore-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "zgitignore-${pkgver}"
	pytest
}

package() {
	cd "zgitignore-${pkgver}"
	python -m installer --destdir="${pkgdir}/" dist/*.whl
}
