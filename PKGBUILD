# Maintainer: David Runge <dave@sleepmap.de>
_name=Yapsy
pkgname=python-yapsy
pkgver=1.12.0
pkgrel=2
pkgdesc="A simple plugin system for Python applications"
arch=('any')
url="http://yapsy.sourceforge.net/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('115b5d1a99aeef01b2f0826554d4aebab33144560ec5dbde24c5ae8ab5082f859bab2d23e3a65bce2d1f81035ccba576a2775149e23ecb0fdbc59c5b9861ce03')

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
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 LICENSE.txt \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm 644 {CHANGELOG,README}.txt \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
