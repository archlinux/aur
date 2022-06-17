# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-stringbrewer
_pyname=${pkgname#python-}
pkgver=0.0.1
pkgrel=1
pkgdesc='Generate random strings matching a pattern'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
_pydeps=(rstr
         sre-yield)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('c2d113822f9393500b273cc833a21ce739036c02c62f47042e0f17ef9b9ea649')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	# install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
