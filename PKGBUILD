# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Zhaofeng Li <hello@zhaofeng.li>
# Contributor: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=python-pex
pkgver=2.1.50
pkgrel=1
arch=('any')
pkgdesc='a tool for generating executable Python environments'
url='https://github.com/pantsbuild/pex'
license=('Apache')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-dephell')
# checkdepends=('python-pytest-runner' 'python-pkginfo')
changelog=CHANGES.rst
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('A1FE765B15233EAD18FA6ABB93E55CB567B5C626')

prepare() {
	cd "$pkgname"
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "$pkgname"
	python setup.py build
}

## 25 minutes to run a test suite lol no thanks
# check() {
# 	cd "$pkgname"
# 	echo ':: Warning: This test will last at least five minutes. You have been warned.'
# 	python setup.py pytest
# }

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
