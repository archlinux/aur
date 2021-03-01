# Maintainer: Matthew T Hoare <matthew dot t dot hoare at gmail dot com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Daniel Hommel <dhommel@gmail.com>

pkgname=mksh-git
_pkgname=mksh
_pkgver=R56c
pkgver=r3550.e945681a
pkgrel=1
pkgdesc='The MirBSD Korn Shell - an enhanced version of the public domain ksh (development version)'
url='https://www.mirbsd.org/mksh.htm'
license=('custom')
arch=('i686' 'x86_64')
depends=('glibc') # Make namcap happy.
makedepends=('git')
conflicts=('mksh' 'mksh-static' 'mksh-static-git')
install=mksh.install
source=('mksh::git+http://github.com/MirBSD/mksh#branch=master'
        'https://www.mirbsd.org/TaC-mksh.txt')
md5sums=('SKIP'
         '66cdcde14239f6a3a070dd11d01d1891')
sha256sums=('SKIP'
            '8a53fe4d643fb7341e6c94653d63d3d813d8d849fc1d9dfe5dc49ab2fb48aee9')
sha512sums=('SKIP'
            '860cee206fe96c4cd9a36a62d39d323994b233d13c022f8ac2fa57fe2b7f40c320239c90ef991688f182f8dd31e6962245009a8ba92d9b7a111105859253829a')

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
  sh Build.sh -r
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m 755 mksh "$pkgdir/usr/bin/mksh"
  install -D -m 644 mksh.1 "$pkgdir/usr/share/man/man1/mksh.1"
  install -D -m 644 dot.mkshrc "$pkgdir/etc/skel/.mkshrc"
  install -D -m 644 "$srcdir/TaC-mksh.txt" "$pkgdir/usr/share/licenses/mksh-git/TaC-mksh.txt"
}

# vim:set ts=2 sw=2 et:
