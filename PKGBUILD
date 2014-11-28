# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=sudsds
pkgver=1.0.1
pkgrel=1
pkgdesc="Fork of the suds library, modified to meet the needs for interaction with the servers of Datové schránky"
arch=('any')
url="https://labs.nic.cz/page/969/datovka/"
license=('LGPL')
makedepends=('python2-setuptools')
source=(http://www.nic.cz/public_media/datove_schranky/releases/src/$pkgname-$pkgver.tar.gz)
sha256sums=('eea36b873a98cce4b5597812f62e2c20eb534dd520a569d6aa250e29ea83ea9c')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

#Python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --root="${pkgdir}"
}
