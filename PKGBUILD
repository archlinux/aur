# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname="python-patreon"
_pkgname="patreon-python"
pkgver=0.5.0
pkgrel=1
pkgdesc="Python wrapper for the Patreon API"
arch=("any")
url="http://github.com/Patreon/patreon-python"
license=("Apache-2.0")
depends=("python-requests" "python-six")
makedepends=("python-setuptools")
checkdepends=("python-mock" "python-pytest" "python-pytest-cov")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Patreon/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2af5cb53610201b8793ee017e42fa9756f97333ede42f4f0aae356ae7f965eec')

build() {
	cd "$_pkgname-$pkgver"
	python ./setup.py build
}

check() {
	cd "$_pkgname-$pkgver"
	python ./setup.py test
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
