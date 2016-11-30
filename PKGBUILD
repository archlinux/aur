# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

_pkgname=cutadapt
pkgname=python2-$_pkgname
pkgver=1.12
pkgrel=1
pkgdesc='trim adapters from high-throughput sequencing reads'
arch=('i686' 'x86_64')
url="http://cutadapt.readthedocs.io/en/v$pkgver/"
license=('custom')
depends=('python2')
makedepends=('cython2')
provides=('cutadapt')
conflicts=('python-cutadapt')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/marcelm/cutadapt/archive/v$pkgver.tar.gz")
md5sums=('6f39ba00b1d71078d431f0c407b4d884')

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
