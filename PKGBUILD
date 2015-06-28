# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=4suite
pkgver=1.0.2
pkgrel=2
pkgdesc="A platform for XML processing and knowledge-management"
arch=('any')
url="http://foursuite.sourceforge.net/"
depends=('python2')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/foursuite/4Suite-XML-${pkgver}.tar.bz2)
md5sums=('b3e976a666899113d58f333518205968')

package() {
  cd "${srcdir}"/4Suite-XML-${pkgver}

  python2 setup.py install --root="${pkgdir}" --system

# python fix
  cd "${pkgdir}"/usr/bin

  for file in $(find . -name '4x*' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}
