# Maintainer: Thomas Berryhill <tb01110100@gmail.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python2-wsgiref
pkgver=0.1.2
pkgrel=2
pkgdesc="WSGI (PEP 333) Reference Library"
arch=(any)
url=http://cheeseshop.python.org/pypi/wsgiref
license=(PSF ZPL)
depends=(python2)
makedepends=(python2-setuptools)
source=(http://pypi.python.org/packages/source/w/${pkgname#*-}/${pkgname#*-}-$pkgver.zip)
sha256sums=('c7e610c800957046c04c8014aab8cce8f0b9f0495c8cd349e57c1f7cabf40e79')
sha512sums=('d6a8723cf6b94e712630cec8667d15d77551ea3005bed6e57079ea3c0fa898328c7f9aafc6bdb3c5f0545f82ec147bea90a5fa65f0889dee199ed7b24d9ff2ff')

prepare() {
    find ${pkgname#*-}-$pkgver -name '*.py' -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
}

build() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py build
}

package() {
    cd ${pkgname#*-}-$pkgver/
    python2 setup.py install --root="$pkgdir" --optimize=1
}
