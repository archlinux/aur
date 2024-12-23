# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-whatever
pkgver=0.7
_commit=7f2cab8e8dfe50e0696b149c68b1c3fff7b70094
pkgrel=6
pkgdesc='Easy way to make anonymous functions by partial application of operators'
arch=(any)
license=(BSD-3-Clause)
url='https://github.com/Suor/whatever'
depends=(python)
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-pytest)
source=("git+https://github.com/Suor/whatever.git#commit=$_commit")
sha512sums=('2d35dbc01ccbcca20e723c5a1156e17cbb15cbbfd50531204ae3eeddd74ca0072e1bb78018b74cb95cef0cba0a27f18036160e36107ae4c3ea61b96ab9e70adf')

build() {
	cd whatever
	python -m build -wn
}

check() {
	cd whatever
	pytest
}

package() {
	cd whatever
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
