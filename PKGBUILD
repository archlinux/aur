# Maintainer: Matthew T Hoare <matthew dot t dot hoare at gmail dot com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Daniel Hommel <dhommel@gmail.com>

pkgname=mksh-static-git
_pkgname=mksh
_pkgver=R56
pkgver=56.r3154.3a4eaf6
pkgrel=3
pkgdesc='The MirBSD Korn Shell - an enhanced version of the public domain ksh (statically-linked development version)'
url='https://www.mirbsd.org/mksh.htm'
license=('custom')
arch=('i686' 'x86_64')
makedepends=('git')
conflicts=('mksh' 'mksh-static' 'mksh-git')
install=mksh.install
source=('mksh::git+http://github.com/MirBSD/mksh#branch=master'
        'https://www.mirbsd.org/TaC-mksh.txt')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$srcdir/$_pkgname"
  ./test.sh
}

build() {
  cd "$srcdir/$_pkgname"
  CC='musl-gcc -static' sh Build.sh -r
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m 755 mksh "$pkgdir/usr/bin/mksh"
  install -D -m 644 mksh.1 "$pkgdir/usr/share/man/man1/mksh.1"
  install -D -m 644 dot.mkshrc "$pkgdir/etc/skel/.mkshrc"
  install -D -m 644 "$srcdir/TaC-mksh.txt" "$pkgdir/usr/share/licenses/mksh-static-git/TaC-mksh.txt"
}

# vim:set ts=2 sw=2 et:
