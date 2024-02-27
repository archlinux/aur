# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-youseedee
_pyname=${pkgname#python-}
pkgver=0.5.3
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
sha256sums=('850908f2476ba292e23bce8b5c3cba79099adc5120e3c80b95d53b6c583d7732')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	# install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
