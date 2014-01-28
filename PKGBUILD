# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgbase=python-boto
pkgname=python2-boto
pkgver=2.23.0
pkgrel=2
pkgdesc='A Python interface to Amazon Web Services (AWS)'
arch=('any')
url='https://github.com/boto/boto'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools' 'git')
conflicts=('python-boto>=2.5.2-1')
replaces=('python-boto>=2.5.2-1')
source=("git+https://github.com/boto/boto.git#tag=$pkgver"
        'LICENSE')

prepare() {
  cd boto

  # python2 fix
  find . -name '*.py' -type f -print0 | xargs -0 \
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_'
}

package_python2-boto() {
  cd boto

  python2 setup.py install -O1 --root="$pkgdir"
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('SKIP'
            '1d7ec138faa438b8302b9d15a5b8ec80dcda4b9854408095cf01f83b6d131cf6e567e564b888fdddab087953a595d85487435bb8aca445354bd0be14676a3a8d')
