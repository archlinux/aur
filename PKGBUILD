# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=kaa-metadata
pkgver=0.7.7
pkgrel=5
pkgdesc="KAA metadata package"
url="http://freevo.sourceforge.net/"
license=('GPL2')
depends=('libdvdread' 'python2' 'kaa-base')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/freevo/$pkgname-$pkgver.tar.gz")
sha256sums=('7466058f1f69e40a9e26c8e6219c13c3a4f1b5228effc88035d9f4fe287cf450')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # python2 fix
  find . -name '*.py' -exec \
    sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_;s_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' '{}' \;

  python2 setup.py install --prefix=${pkgdir}/usr --optimize=1

  # rename executable, conflicts with mmpython FS#14601
  mv ${pkgdir}/usr/bin/mminfo ${pkgdir}/usr/bin/kaa-mminfo
}
