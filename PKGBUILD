# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=seqdiag
pkgver=2.0.0
pkgrel=1
pkgdesc="seqdiag generates sequence-diagram images from .diag files"
url="http://blockdiag.com/en/seqdiag/index.html"
license=('Apache')
arch=('any')
depends=('blockdiag')
checkdepends=('python-nose' 'python-pycodestyle' 'python-reportlab' 'python-docutils')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blockdiag/seqdiag/archive/$pkgver.tar.gz")
sha512sums=('ec4ebfc2822dd1b4dd65881b2199f512cab3ac3772451e87a1f798f36925ebb7b5824a8cd797d9e6f128698340c04e89ba226af37b02d40cf9b38638545af9bb')

build() {
  cd seqdiag-$pkgver
  python setup.py build
}

check() {
  cd seqdiag-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages" nosetests || warning "Tests failed"
}

package() {
  cd seqdiag-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
