# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname=python-datadog
_name=datadog
pkgver=0.47.0
pkgrel=1
pkgdesc="The Datadog Python library and dogshell"
arch=(any)
url="https://github.com/DataDog/datadogpy"
license=('BSD')
depends=(
	'python>=3.7'
	'python-requests>=2.6.0'
)
devdepends=(
    'python-hatchling>=0.15.0'
)
makedepends=(python-build python-hatchling python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha512sums=('de7ac3654d147c63203869197c65b924eca4e6c3fe490352a4858c36a8e789d30d01eef6711eaa633630045e14ef3811252ce0485cb777c79b19b42470c10376')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" $_name-$pkgver/dist/*.whl
    install -Dm0644 $_name-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 $_name-$pkgver/LICENSE-3rdparty.csv "$pkgdir/usr/share/licenses/$pkgname/LICENSE-3rdparty.csv"
}
