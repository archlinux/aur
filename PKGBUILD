# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Yann Büchau <nobodyinperson@posteo.de>

pkgname=hledger-utils
pkgver=1.13.2
pkgrel=1
pkgdesc='Utilities extending the hledger plaintextaccounting tool'
arch=(any)
url="https://gitlab.com/nobodyinperson/$pkgname"
license=(GPL)
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
sha256sums=('646bae1537383f1c5946323beca8be48616dcadd641acce36f1bbc95107ad548')

build () {
	cd "$_archive"
	python -m build -wn
}

package () {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	local _py3_ver=$(python --version | cut -d " " -f2)
	rm -rf "$pkgdir/usr/lib/python${_py3_ver%.*}/site-packages/tests"
}
