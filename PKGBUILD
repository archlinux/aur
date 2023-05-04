# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname=python-datadog
_name=datadog
pkgver=0.45.0
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
sha512sums=('cfd67c7717d638cf70bbf4874f7645bfaa38e6925b01db1f312f4ee1303214650e8a7fe51024b742785443f57cd6763ea262063ba5dba9c37a7a5fd7084ed735')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" $_name-$pkgver/dist/*.whl
    install -Dm0644 $_name-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 $_name-$pkgver/LICENSE-3rdparty.csv "$pkgdir/usr/share/licenses/$pkgname/LICENSE-3rdparty.csv"
}
