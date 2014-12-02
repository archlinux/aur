# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=sshconf
pkgver=0.6.2.1
pkgrel=1
pkgdesc="A graphical frontend to manage ssh configurations for different hosts"
arch=('any')
url="http://sourceforge.net/apps/trac/sshconf"
license=('GPL3')
depends=('desktop-file-utils' 'kdebindings-python2' 'openssh' 'python2' 'qt4')
install=$pkgname.install
source=(http://download.sourceforge.net/project/$pkgname/${pkgname}_${pkgver}.tar.gz)
sha256sums=('68467c5af80e04cf7168bc666bcb18f5df6d389ccbe78ef39156a63f204a0d3d')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

#Python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --root="${pkgdir}"
}
