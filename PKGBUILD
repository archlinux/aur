# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=dslib
pkgver=3.1
pkgrel=1
pkgdesc="Free Python library for accessing Datove schranky"
arch=('any')
url="http://labs.nic.cz/page/740/dsgui/"
license=('LGPL')
depends=('python2-pyopenssl')
makedepends=('python2-setuptools')
source=(http://www.nic.cz/public_media/datove_schranky/releases/src/$pkgname-$pkgver.tar.gz)
sha256sums=('7f5542f57c5b54f3190b7497b1da4acb04061639e9db3a7e99db33b3c3359b16')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

#Python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --root="${pkgdir}"
}
