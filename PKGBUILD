# Maintainer: Matthew T Hoare <matthew.t.hoare at gmail dot com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Daniel Hommel <dhommel@gmail.com>
# Contributor: José Neder <jlneder@gmail.com>

pkgname=mksh-static
_pkgname=mksh
pkgver=59c
_pkgver=R$pkgver
pkgrel=1
pkgdesc='The MirBSD Korn Shell - an enhanced version of the public domain ksh (static build, linked with musl)'
url='https://www.mirbsd.org/mksh.htm'
license=('custom')
arch=('i686' 'x86_64')
makedepends=('musl')
conflicts=('mksh' 'mksh-git' 'mksh-static-git')
install=mksh.install
source=("https://www.mirbsd.org/MirOS/dist/mir/mksh/$_pkgname-$_pkgver.tgz"
        'https://www.mirbsd.org/TaC-mksh.txt')
sha512sums=('f56b6956f9e1dd88ddce2294301a5eb698050d9d4f49286fdcd8f9df8554eabbcc71d37e2bf3eb7234e3968a17231cc6de8aa7efbf17768834a90b14e8cdf340'
            '860cee206fe96c4cd9a36a62d39d323994b233d13c022f8ac2fa57fe2b7f40c320239c90ef991688f182f8dd31e6962245009a8ba92d9b7a111105859253829a')

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
  install -D -m 644 "$srcdir/TaC-mksh.txt" "$pkgdir/usr/share/licenses/mksh-static/TaC-mksh.txt"
}

# vim:set ts=2 sw=2 et:
