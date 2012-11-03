# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Maintainer: Aaron Schaefer <aaron@elasticdog.com>

pkgbase=python-boto
pkgname=python2-boto
pkgver=2.6.0
pkgrel=1
pkgdesc='A Python interface to Amazon Web Services (AWS)'
arch=('any')
url='https://github.com/boto/boto'
license=('MIT')
depends=('python2')
conflicts=('python-boto>=2.5.2-1')
replaces=('python-boto>=2.5.2-1')
source=("http://github.com/downloads/boto/boto/boto-$pkgver.tar.gz"
        'LICENSE')
md5sums=('f91986376c0330f837b935d833b6f6aa'
         '35ebd993c05c79ba78e9f4fb3e65e547')

build() {
  cd "$srcdir/boto-$pkgver"

  # python2 fix
  find . -name '*.py' -type f -print0 | xargs -0 \
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_'
}

package_python2-boto() {
  cd "$srcdir/boto-$pkgver"
  python2 setup.py install --root="$pkgdir"
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
