# Maintainer: David Runge <dave@sleepmap.de>
_name=Yapsy
pkgname=python-yapsy
pkgver=1.12.2
pkgrel=8
pkgdesc="A simple plugin system for Python applications"
arch=('any')
url="http://yapsy.sourceforge.net/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('3fdb4de1a6d8f836e22d82354492b99ec9883443c389393d25ea40a08bb0b6ae03db9c947af55237b67764facd4d55a09a36cdba107c8d9202f3700fd55c31fa')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  python runtests.py
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --prefix=/usr \
                          --skip-build \
                          --optimize=1 \
                          --root="${pkgdir}"
  install -vDm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 {CHANGELOG,README}.txt \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
