# Maintainer: Aaron Schaefer <aaron@elasticdog.com>
pkgname=python-boto
pkgver=1.9b
pkgrel=2
pkgdesc='A Python interface to Amazon Web Services (AWS)'
arch=('any')
url='http://code.google.com/p/boto/'
license=('MIT')
depends=('python2')
source=("http://boto.googlecode.com/files/boto-$pkgver.tar.gz" 'LICENSE')
md5sums=('4fc2fd7b70a971b1363f8465aafe7091'
         '35ebd993c05c79ba78e9f4fb3e65e547')

build() {
  cd "$srcdir/boto-$pkgver"

  # python2 fix
  for file in boto/{pyami,services,tests}/*.py; do
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --root="$pkgdir"
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
