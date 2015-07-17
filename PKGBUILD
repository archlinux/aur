# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

_pkgname=cutadapt
pkgname=python2-$_pkgname
pkgver=1.8.1
pkgrel=1
pkgdesc='trim adapters from high-throughput sequencing reads'
arch=('i686' 'x86_64')
url="http://code.google.com/p/$_pkgname/"
license=('custom')
depends=('python2')
source=("https://pypi.python.org/packages/source/c/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('bcc9cc9d5ac5c8fc5bf91aad42fa7f82')
provides=('cutadapt')
conflicts=('python-cutadapt')

prepare() {
  cd $srcdir/$_pkgname-$pkgver

  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
      -i cutadapt/scripts/cutadapt.py
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  python2 setup.py install --root=$pkgdir --optimize=1

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
