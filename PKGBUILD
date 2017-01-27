# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: Antonio Rojas <arojas at archlinux dot org>

pkgbase=python-webassets
pkgname=('python2-webassets' 'python-webassets')
_pipname=webassets
pkgver=0.12.1
pkgrel=1
pkgdesc="Asset management application for Python web development"
arch=('any')
url="http://github.com/miracle2k/webassets"
license=('BSD')
makedepends=('python2-django' 'python-django' 'python2-setuptools' 'python-setuptools')
source=("https://github.com/miracle2k/webassets/archive/$pkgver.tar.gz")
sha256sums=('34d94191b9c69df16fb6504d513a57851870e545bec7ad239e93e66bb9767682')

prepare() {
  cp -r $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-webassets() {
depends=('python2-django')
optdepends=('python2-pillow: support for image manipulation'
            'python2-nose: required to run tests'
            'python2-mock: required to run tests')

  cd python2-$_pipname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1

  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' -i $pkgdir/usr/lib/python2.7/site-packages/webassets/filter/rjsmin/rjsmin.py

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname

  mv $pkgdir/usr/bin/webassets{,2}
}

package_python-webassets() {
depends=('python-django')
optdepends=('python-pillow: support for image manipulation'
            'python-nose: required to run tests'
            'python-mock: required to run tests')

  cd $_pipname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}
