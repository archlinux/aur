# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-youseedee
_pyname=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc='Interface to the Unicode Character Database'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
_pydeps=(requests)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('7dd23808151231b74a5b4aa0e32db6c23588e9b868b600e441d14c73d5f4d1ab')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	# install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
