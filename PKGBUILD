# Maintainer: Matthew T Hoare <matthew.t.hoare at gmail dot com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Daniel Hommel <dhommel@gmail.com>

pkgname=mksh-static
_pkgname=mksh
pkgver=56c
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
sha512sums=('7e4cd2d24c6bca2ebad7c6b02d158188e766bd4693d93f5bed198d69238aef078d42ce911431ad4e419e4af55083047d823bfad53973db5c6d8a685482770135'
         '14ec4ad9822e4c93bd036ba71fb6e1e77e9c36cbcea18c0c72e90f18d132382ef9a2a430425b93a4aa2693bfb4ca9ceeb0a86a99652075c1692d89b6a92ddce8')

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
