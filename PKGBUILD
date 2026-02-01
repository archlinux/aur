# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Zen <dev@pyl.onl>

pkgname=python-pycpio
_name=${pkgname#python-}
pkgver=1.6.0
pkgrel=1
pkgdesc='Python library for CPIO manipulation'
arch=(any)
url="https://github.com/desultory/$_name"
license=(GPL-2.0-only)
depends=(python python-zenlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('768c7773343bc19de893edfd5640f79df29b13ecf051b644b751a2f6f699d836f2add472a7c439af9bc7348c0e1833b9bea2230349fc3961411135c962df1ca0')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    rm -rf test-env
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m unittest discover tests -v
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
