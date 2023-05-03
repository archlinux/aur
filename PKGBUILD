# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-xmldiff
_pyname=${pkgname#python-}
pkgver=2.4
pkgrel=4
pkgdesc='A libray and command line utility for diffing xml'
arch=(any)
url="https://$_pyname.readthedocs.io"
license=(BSD)
depends=(python
         python-lxml
         python-six)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('05bea20ce1f2c9678683bcce0c3ba9981f87d92b709d190e018bcbf047eccf63')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	python -m unittest discover
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
