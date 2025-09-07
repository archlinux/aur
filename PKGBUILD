# Maintainer: Toby Vincent <tobyv@tobyvin.dev>

pkgname=python-factoriocalc
pkgver=0.3.0
pkgrel=2
pkgdesc='A python module to help you plan your factory for Factorio.'
arch=('any')
url='https://github.com/FactorioCalc/FactorioCalc/'
license=('AGPL-3.0-or-later')
depends=('python>=3.7')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools'
             'python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f6172a247733bfb3b955bec2f69a6e21c0c6080b4ec9fe5c5fce7a02f57adb67')

prepare() {
	cd "FactorioCalc-$pkgver"
	printf 'include factoriocalc/game-info*.json\n' >MANIFEST.in
}

build() {
	cd "FactorioCalc-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "FactorioCalc-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
