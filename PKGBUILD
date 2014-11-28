# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=ssh-installkeys
pkgver=1.9
pkgrel=1
pkgdesc="Set up password-less SSH logins"
arch=('any')
url="http://www.catb.org/~esr/$pkgname"
license=('BSD')
depends=('python2' 'openssh')
makedepends=('xmlto' 'docbook-xsl')
source=(http://www.catb.org/~esr/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('e2c47688df8628bcfa946d98a94f31812e9c5f90a90d8596f85dc3c935f7346f')

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  make ssh-installkeys.1
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

#Python2 fix
  sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $pkgname

  install -D -m755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -D -m644 $pkgname.1 "${pkgdir}"/usr/share/man/man1/$pkgname.1
  install -D -m644 COPYING "${pkgdir}"/usr/share/licenses/ssh-installkeys/COPYING
}
