# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: wide-eye <eyeswide@gmail.com>

pkgname=http-replicator
pkgver=3.0
pkgrel=2
pkgdesc="A caching proxy to serve http files to multiple clients at once"
arch=('any')
url="http://gertjan.freezope.org/replicator/"
license=('GPL')
depends=('python2')
source=(ftp://ftp.fit.vutbr.cz/pub/systems/gentoo/distfiles/${pkgname}_${pkgver}.tar.gz)
md5sums=('5db9882611f34ea2a104a86db142ceec')

package() {
  cd "${srcdir}"/${pkgname}_${pkgver}

# python2 fix
  for file in $(find . -name 'http-*' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm755 ${pkgname}_maintenance "${pkgdir}"/usr/bin/${pkgname}_maintenance

  install -Dm644 $pkgname.1 "${pkgdir}"/usr/share/man/man1/$pkgname.1
  install -Dm644 ${pkgname}_maintenance.1 "${pkgdir}"/usr/share/man/man1/${pkgname}_maintenance.1
}
