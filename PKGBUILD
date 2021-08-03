# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-xmldiff
_pyname=${pkgname#python-}
pkgver=2.4
pkgrel=2
pkgdesc='A libray and command line utility for diffing xml'
arch=(any)
url="https://$_pyname.readthedocs.io"
license=(BSD)
depends=(python
         python-lxml
         python-six)
makedepends=(python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('05bea20ce1f2c9678683bcce0c3ba9981f87d92b709d190e018bcbf047eccf63')

build() {
	cd "$_archive"
	export PYTHONHASHSEED=0
	python setup.py build
}

check() {
	cd "$_archive"
	python setup.py test
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
