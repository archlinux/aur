# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Quan Guo <guotsuan@gmail.com>

pkgname=python-astroml
_pkgname=astroML
pkgver=1.0
pkgrel=1
pkgdesc='Machine learning, statistics, and data mining for astronomy and astrophysics'
url='https://www.astroml.org'
arch=('any')
license=('BSD')
depends=(
	'python>=3.5'
	'python-astropy>=3.0'
	'python-matplotlib>=3.0'
	'python-numpy>=1.13'
	'python-scipy>=0.18'
	'python-scikit-learn>=0.18')
optdepends=('astroml-examples')
makedepends=('python-setuptools' 'git')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver::git+https://github.com/astroml/astroml#tag=v$pkgver?signed"
        '001-setup.cfg.patch')
sha256sums=('SKIP'
            'dbca87eba820555aa95ff6e055d974f553fd3bef14eca0fdc8c28966743d33dd')
validpgpkeys=('0DD00E57D2FBEBA214389EC58BC1E9224F65DAD4')

prepare() {
	patch -p1 -d "$pkgname-$pkgver" < 001-setup.cfg.patch
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python setup.py pytest
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst CITATION -t "$pkgdir/usr/share/doc/$pkgname/"
}
