# Maintainer: rosetintedcheeks <oaks at rosetintedcheeks dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Zhaofeng Li <hello@zhaofeng.li>
# Contributor: Carlo Cabanilla <carlo.cabanilla@gmail.com>


pkgname=python-pex
_pkgname=pex
pkgver=2.3.0
_srcdir="$_pkgname-$pkgver"
pkgrel=1
arch=('any')
pkgdesc='Generates executable Python environments'
url='https://docs.pex-tool.org/'
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-tox')
changelog=CHANGES.md
provides=('pex')
replaces=('pex')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/pex-tool/pex/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('44e8a6b2c989dd6e75be9c6667f25be9664603b18733e69a3209e8defa01d13a')

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_srcdir"
 	tox -e check
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
