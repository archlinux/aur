# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgbase=python-boto
pkgname=python2-boto
pkgver=2.31.1
pkgrel=1
pkgdesc='A Python interface to Amazon Web Services (AWS)'
arch=('any')
url='https://github.com/boto/boto'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools' 'git')
checkdepends=('python2-nose' 'python2-mock' 'python2-requests' 'python2-httpretty')
conflicts=('python-boto>=2.5.2-1')
replaces=('python-boto>=2.5.2-1')
source=("git+https://github.com/boto/boto.git#tag=$pkgver")

prepare() {
  cd boto

  # python2 fix
  find . -name '*.py' -type f -print0 | xargs -0 \
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_'
}

check() {
  cd boto
  python2 tests/test.py tests/unit
}

package_python2-boto() {
  cd boto

  python2 setup.py install -O1 --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('SKIP')
