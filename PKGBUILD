# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Yann Büchau <nobodyinperson@posteo.de>

pkgname=hledger-utils
pkgver=1.14.0
pkgrel=3
pkgdesc='Utilities extending the hledger plaintextaccounting tool'
arch=(any)
url="https://gitlab.com/nobodyinperson/$pkgname"
license=(GPL-3.0-or-later)
_pydeps=(asteval
         cycler
         # drawilleplot
         matplotlib
         numpy
         pandas
         psutil
         rich
         scipy)
depends=(hledger
         python
        "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('d4fcd345ccae05ef62d3d21337cd6173af9ef3d919ffd9e7650a10ba31392486')

build () {
	cd "$_archive"
	python -m build -wn
}

package () {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	local _pyver=$(python --version | cut -d " " -f2)
	rm -rf "$pkgdir/usr/lib/python${_pyver%.*}/site-packages/tests"
}
