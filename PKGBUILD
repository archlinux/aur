# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-tradingeconomics
_pkg="${pkgname#python-}"
pkgver=4.5.1
pkgrel=1
pkgdesc='A library providing an API allowing access to Trading Economics data.'
arch=('any')
url='https://github.com/tradingeconomics/tradingeconomics-python'
license=('GPL-3.0-only')
depends=('python' 'python-pandas' 'python-websocket-client')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/$_pkg/$_pkg-$pkgver.tar.gz")
b2sums=('24180a5a616d8494dcf113bd28772c42a7146e928f3476b8029d6b8e25b5d1f471aa6fd6fde264326d7431d69af8f6223ea0400605775e1734309769c08ff65c')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
