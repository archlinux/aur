# Maintainer: Omar Sandoval <osandov at osandov dot com>
# Contributor: Roger Zanoni <rogerzanoni@gmail.com>
# Contributor: Sylvain Henry <hsyl20@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Dan McGee <dpmcgee@gmail.com>
# Contributor: LeCrayonVert <sunrider@laposte.net>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vladimir Kirillov <proger@wilab.org.ua>

pkgname=coccinelle-git
_pkgname=coccinelle
pkgver=1.0.8.r209.0e1f2b1f
pkgrel=1
pkgdesc="Provides spatch program used to apply semantic patches"
arch=('i686' 'x86_64')
url="http://coccinelle.lip6.fr/"
license=('GPL2')
makedepends=('git' 'ocaml' 'ocaml-findlib' 'ocaml-num')
depends=('pcre' 'python')
optdepends=('ocaml: OCaml scripting feature'
            'ocaml-findlib: OCaml scripting feature')
options=('!strip' '!makeflags')
conflicts=('coccinelle')
provides=('coccinelle')
source=('git+https://github.com/coccinelle/coccinelle.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$_pkgname"

  ./autogen
  ./configure \
    --prefix=/usr \
    --enable-release=yes \
    --with-python=/usr/bin/python3
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" MANDIR="/usr/share/man" \
    BASH_COMPLETION_DIR="/etc/bash_completion.d" install
}

# vim:set ts=2 sw=2 et:
