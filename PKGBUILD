# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=psautohint
pkgver=2.3.1
pkgrel=1
epoch=2
pkgdesc='A standalone version of AFDKO’s autohinter'
arch=(x86_64)
url="https://github.com/adobe-type-tools/$pkgname"
license=(Apache)
_py_deps=(fonttools
          fs
          lxml)
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(python-setuptools-scm)
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.zip")
sha256sums=('ff2529dfd7cc58cf8b709714b9abd3468354742f18c1a140eb252e18f41a51d4')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
