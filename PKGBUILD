# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='stem'
pkgname="python2-$_projectname"
pkgver='1.8.0'
pkgrel='5'
pkgdesc='Tor control library for Python - python2 version'
arch=('any')
url="https://$_projectname.torproject.org"
license=('LGPL3')
depends=('python2' 'python2-cryptography' 'python2-pysha3')
optdepends=('tor: tor-server to talk to')
makedepends=('python2-setuptools')
provides=("$_projectname")
conflicts=("$_projectname")
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::https://files.pythonhosted.org/packages/source/${_projectname::1}/${_projectname}/${_projectname}-${pkgver}.tar.gz"
	"$pkgname-$pkgver-$pkgrel.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_projectname::1}/${_projectname}/${_projectname}-${pkgver}.tar.gz.asc"
)
sha512sums=('aa2033567b79aef960f8321e4c6cbc28105c59d6513ff49a9f12509d8f97b1a2e8a3b04dc28abb07fad59b0f6ba66443b92bbefa0d08b26038bbaf24f7f2846d'
            'SKIP')
validpgpkeys=('68278CC5DD2D1E85C4E45AD90445B7AB9ABBEEC6') # Damian Johnson (www.atagar.com) <atagar1@gmail.com>

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	find . -type f -exec sed -i 's|#!/usr/bin/env python$|#!/usr/bin/env python2.7|g' {} \;
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
