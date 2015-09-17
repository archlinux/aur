# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gpicsync
pkgver=1.33
pkgrel=1
pkgdesc='Inserts location in your pictures metadata from a GPS tracklog'
arch=('any')
url="https://github.com/metadirective/GPicSync"
license=('GPL2')
depends=('python2' 'python2-pillow' 'python2-unidecode' 'wxpython')
makedepends=('git')
install=$pkgname.install
source=(git://github.com/metadirective/GPicSync.git
        $pkgname $pkgname.desktop)
md5sums=('SKIP'
         '7bb84135e4b289628d9dd65b8c05d897'
         'a5d4ffa8df81587674d2f4d2b178086f')

prepare() {
  cd "${srcdir}"/GPicSync/src

  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

package() {
  cd "${srcdir}"/GPicSync/src

  install -Dm755 "${srcdir}"/$pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 "${srcdir}"/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.ico "${pkgdir}"/usr/share/pixmaps/$pkgname.ico

  install -d "${pkgdir}"/usr/share/$pkgname
  cp -r locale "${pkgdir}"/usr/share/$pkgname
  cp {*.py,*.jpg,*.ico,*.conf} "${pkgdir}"/usr/share/$pkgname
}
