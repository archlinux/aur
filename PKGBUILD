# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-apg-py
_pyname=${pkgname#python-}
pkgver=1.0.3
pkgrel=3
pkgdesc='an ABNF parser generator creating recursive-descent parsers from a superset of ABNF'
arch=(any)
url="https://github.com/ldthomas/$_pyname"
license=(BSD-2-Clause)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="${_pyname/-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('7c9a198c3e5db71792634823ae1d11b0c1a5b893d35b7eb242015cba543a8f28')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
