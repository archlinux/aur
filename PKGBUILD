# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=dogtail
pkgver=0.9.0
pkgrel=1
pkgdesc="GUI test tool and automation framework"
arch=('any')
license=('GPL')
url='https://fedorahosted.org/dogtail/'
depends=('python2' 'hicolor-icon-theme')
source=("https://fedorahosted.org/released/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('564dae5fba4fa3a7f6d53503e0877dad56ae8bce10e181d3d2c0bdbf063f4e36')
install=$pkgname.install

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/env python/env python2/' examples/*.py
  sed -i 's#/usr/bin/python#/usr/bin/python2#' examples/appstartup.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
