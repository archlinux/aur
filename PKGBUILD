# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Zhukov Pavel <gelios@gmail.com>

pkgname=synce-kde
pkgver=0.16
pkgrel=5
pkgdesc="Provide a means of communication with a Windows CE device - KDE tools and integration"
arch=(any)
url="http://synce.sourceforge.net/"
license=('GPL')
depends=('synce-core' 'synce-rra' 'pygobject' 'synce-sync-engine'
         'python2-pyqt4')
optdepends=('unshield' 'orange' 'dynamite')
makedepends=('synce-rra' 'python2-setuptools')
source=("http://downloads.sourceforge.net/synce/synce-kpm-$pkgver.tar.gz")
md5sums=('5e4b79e13488010e89c9c523a44945ea')

prepare() {
  # python2 fix
  for file in $(find "${srcdir}" -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

package() {
  cd "$srcdir"/synce-kpm-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
