# Maintainer: Robin Ekman < robin.seth.ekman [at] gmail [dot] com >

pkgname=python-ass
pkgver=0.5.4
pkgrel=1
pkgdesc="A library for parsing and manipulating Advanced SubStation Alpha subtitle files."
url='http://github.com/chireiden/python-ass'
arch=('any')
license=('MIT')
depends=('python>=3.8')
makedepends=('python-setuptools')
source=('https://github.com/chireiden/python-ass/archive/refs/tags/0.5.4.tar.gz')
sha256sums=('1a2bf40a87f1a4b7d81fac5805289bfcd11d202e00e5844211d0dda44c884618')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

prepare() {
    # Clean out old wheels etc.
    git -C "${pkgname%-git}" clean -dfx
}

check () {
    pytest "${pkgname}-${pkgver}"
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
