# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
pkgname="python-pyln-bolt7"
_name=${pkgname#python-}
pkgver="24.02.1"
pkgrel=1
pkgdesc="BOLT7"
arch=("any")
url="https://github.com/ElementsProject/lightning/blob/master/contrib/pyln-spec/bolt7"
license=("custom:BSD-MIT")
groups=()
depends=("python")
makedepends=("python-setuptools" "python-poetry")
provides=("python-pyln-bolt7")
source=("https://github.com/ElementsProject/lightning/releases/download/v${pkgver}/clightning-v${pkgver}.zip")
sha256sums=('SKIP')

prepare() {
	mv "clightning-v$pkgver"/"contrib"/"pyln-spec"/"bolt7" "$_name-$pkgver"
	rm -rf "clightning-v$pkgver"
}

build() {
	cd $_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
