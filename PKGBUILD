# Maintainer: Felix Yan <felixonmars@gmail.com>
# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Maintainer: Aaron Schaefer <aaron@elasticdog.com>

pkgbase=python-boto
pkgname=python2-boto
pkgver=2.17.0
pkgrel=1
pkgdesc='A Python interface to Amazon Web Services (AWS)'
arch=('any')
url='https://github.com/boto/boto'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
conflicts=('python-boto>=2.5.2-1')
replaces=('python-boto>=2.5.2-1')
source=("http://github.com/boto/boto/archive/${pkgver}.tar.gz"
        'LICENSE')

prepare() {
  cd boto-$pkgver

  # python2 fix
  find . -name '*.py' -type f -print0 | xargs -0 \
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_'
}

package_python2-boto() {
  cd boto-$pkgver

  python2 setup.py install --root="$pkgdir"
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('43be5f14a11ca5cb2f76c8b8fa256e34070400ee1844fd58495744a36f490f2aacf6453c951ab628eebbd82d469d220636570a9dc9ccd661133dffe491f8eedd'
            '1d7ec138faa438b8302b9d15a5b8ec80dcda4b9854408095cf01f83b6d131cf6e567e564b888fdddab087953a595d85487435bb8aca445354bd0be14676a3a8d')
