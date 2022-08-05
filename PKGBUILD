# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname=python-datadog
_name=datadog
pkgver=0.44.0
pkgrel=1
pkgdesc="The Datadog Python library and dogshell"
arch=(any)
url="https://github.com/DataDog/datadogpy"
license=('BSD')
depends=(
	'python>=3.5'
	'python-requests>=2.6.0'
)
makedepends=(python-build python-hatchling python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha512sums=('579bbb9bb9e89ee32b333ff873d0b04404c5f3ad09baeda26214f720a3ba420e4f441130c5ccce27d91ad8f2b44e0e529c2ad6483a3393269789045a12a32c18')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" $_name-$pkgver/dist/*.whl
    install -Dm0644 $_name-$pkgver.dist-info/license_files/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 $_name-$pkgver.dist-info/license_files/LICENSE-3rdparty.csv "$pkgdir/usr/share/licenses/$pkgname/LICENSE-3rdparty.csv"
}
