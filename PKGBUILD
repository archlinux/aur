# $Id: PKGBUILD 224581 2017-04-23 14:47:41Z ttoepper $
# Maintainer: Matthew T Hoare <matthew dot t dot hoare at gmail dot com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Daniel Hommel <dhommel@gmail.com>

pkgname=mksh-static
_pkgname=mksh
_pkgver=R55
pkgver=55
pkgrel=1
pkgdesc='The MirBSD Korn Shell - an enhanced version of the public domain ksh'
url='https://www.mirbsd.org/mksh.htm'
license=('custom')
arch=('i686' 'x86_64')
depends=('glibc') # Make namcap happy.
conflicts=('mksh' 'mksh-git' 'mksh-static-git')
install=mksh.install
source=("https://www.mirbsd.org/MirOS/dist/mir/mksh/$_pkgname-$_pkgver.tgz"
        'https://www.mirbsd.org/TaC-mksh.txt')
md5sums=('718c44251b52c48e7312903273e263f4'
         'SKIP')

check() {
  cd "$srcdir/$_pkgname"
  ./test.sh
}

build() {
  cd "$srcdir/$_pkgname"
  LDSTATIC=-static sh Build.sh -r
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m 755 mksh "$pkgdir/usr/bin/mksh"
  install -D -m 644 mksh.1 "$pkgdir/usr/share/man/man1/mksh.1"
  install -D -m 644 dot.mkshrc "$pkgdir/etc/skel/.mkshrc"
  install -D -m 644 "$srcdir/TaC-mksh.txt" "$pkgdir/usr/share/licenses/mksh/TaC-mksh.txt"
}

# vim:set ts=2 sw=2 et:
