# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=sshconf
pkgver=0.6.2
pkgrel=1
pkgdesc="A graphical frontend to manage ssh configurations for different hosts"
arch=('any')
url="http://sourceforge.net/apps/trac/sshconf"
license=('GPL3')
depends=('desktop-file-utils' 'kdebindings-python' 'openssh' 'python2' 'qt')
install=$pkgname.install
source=(http://download.sourceforge.net/project/$pkgname/${pkgname}_${pkgver}.tar.gz)
sha256sums=('a1a2437212391237d1d3e60db934570791a3b117e9512287ecc8bc1d172993a2')

build() {
  cd ${srcdir}/$pkgname-$pkgver

#Python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --root=${pkgdir}
}
