# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-pygost
_pkgname=${pkgname#python-}
pkgver=5.13
pkgrel=1
pkgdesc=''
arch=('any')
url='http://www.pygost.cypherpunks.ru'
license=('GPL')
groups=()
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
optdepends=()
source=("$pkgname-$pkgver.tar.zst::$url/pygost-$pkgver.tar.zst"
        "$pkgname-$pkgver.tar.zst.asc::$url/pygost-$pkgver.tar.zst.asc")
validpgpkeys=('E6FD1269CD0C009E')
sha256sums=('43c6ca60703352acfc074d6847b0c0652e92ba16f568dac039e645dcf291b360'
            'SKIP')

build() {
  python -m build -nw $srcdir/$_pkgname-$pkgver
}

package() {
  python -m installer \
    --compile-bytecode 1 \
    --destdir $pkgdir \
    $srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver-*-*.whl

  rm -rfv $pkgdir/usr/{AUTHORS,COPYING,FAQ,INSTALL,NEWS,README,THANKS,VERSION}
}
