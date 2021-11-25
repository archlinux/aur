# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=python2-tornado
pkgver=5.1.1
pkgrel=4
pkgdesc='open source version of the scalable, non-blocking web server and tools'
arch=('x86_64')
url='https://www.tornadoweb.org/'
license=('Apache')
depends=('python2-futures' 'python2-singledispatch' 'python2-backports-abc')
optdepends=('python2-monotonic: enable support for a monotonic clock'
            'python2-twisted: for tornado.platform.twisted')
            # 'python2-pycares: an alternative non-blocking DNS resolver'
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tornadoweb/tornado/archive/v$pkgver.tar.gz")
sha512sums=('b35fa0687ede6e672c35ca82fcc01dbb2ae9d8a7f2e4a65b6e07aa5a8eca861a22d775101172b7e33564951d193e5f11887021a3d762bee88668b9ac0069ab46')

export TORNADO_EXTENSION=1

prepare() {
  # python -> python2 rename
  find tornado-$pkgver -name '*py' -exec sed -e 's_#!/usr/bin/env python_&2_' -i {} \;
}

build() {
  cd tornado-$pkgver
  python2 setup.py build
}

package() {
  cd tornado-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
