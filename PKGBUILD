# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-funcy
pkgver=2.0
_commit=13fac0037c109a9e4649fc8ee343be17647f7407
pkgrel=5
pkgdesc='A fancy and practical functional tools'
arch=(any)
license=(BSD-3-Clause)
url='https://github.com/Suor/funcy'
depends=(python)
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-pytest
              python-whatever)
source=("git+https://github.com/Suor/funcy.git#commit=$_commit")
sha512sums=('d5b6528fee0054ddf7c9675e5f2c0ab2b4ded55c71ba59b6ca4e06ecef90c84cd6dc887226e83d90cf2d3b838deba1f8106de1457072b73b7aa2efe15cb3e5e4')

build() {
	cd funcy
	python -m build -wn
}

check() {
	cd funcy
	pytest
}

package() {
	cd funcy
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
