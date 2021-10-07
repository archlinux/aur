# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: vsilv <vsilv@posteo.eu>
# Contributor: pancakes <aur@azz.am>

pkgname=python-krakenex
pkgver=2.1.0
pkgrel=2
pkgdesc="Exchange API for Kraken.com"
arch=('any')
url="https://github.com/veox/python3-krakenex"
license=('LGPL3')
depends=('python-requests>=2.18.2' 'python-requests<3')
makedepends=('git' 'python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('1298BC0A9B0DBEEA3BDDCBA62D3DA6CD74AB3D37')

build() {
	cd "$pkgname"
	python setup.py build
	cd doc
	make man
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 doc/build/man/krakenex.1 -t "$pkgdir/usr/share/man/man1/"
}
