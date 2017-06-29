# $Id: PKGBUILD 114749 2014-07-03 16:29:17Z fyan $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=kaa-metadata
pkgver=0.7.7
pkgrel=5
pkgdesc="KAA metadata package"
url="http://freevo.sourceforge.net/"
license=('GPL2')
depends=('libdvdread' 'python2' 'kaa-base')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/freevo/$pkgname-$pkgver.tar.gz)
md5sums=('4bca23a0c695b4281ae2220022cdeb77')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  
  python2 setup.py install --prefix=${pkgdir}/usr --optimize=1

  # rename executable, conflicts with mmpython FS#14601
  mv ${pkgdir}/usr/bin/mminfo ${pkgdir}/usr/bin/kaa-mminfo
}
