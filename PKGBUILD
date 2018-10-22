# Maintainer: Omar Sandoval <osandov at osandov dot com>
# Contributor: Roger Zanoni <rogerzanoni@gmail.com>
# Contributor: Sylvain Henry <hsyl20@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Dan McGee <dpmcgee@gmail.com>
# Contributor: LeCrayonVert <sunrider@laposte.net>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vladimir Kirillov <proger@wilab.org.ua>

pkgname=coccinelle
pkgver=1.0.7
pkgrel=2
pkgdesc="Provides spatch program used to apply semantic patches"
arch=('i686' 'x86_64')
url="http://coccinelle.lip6.fr/"
license=('GPL2')
makedepends=('ocaml' 'ocaml-findlib' 'ocaml-num')
depends=('pcre' 'python')
optdepends=('ocaml: OCaml scripting feature'
            'ocaml-findlib: OCaml scripting feature')
options=('!strip')
source=(http://coccinelle.lip6.fr/distrib/${pkgname}-${pkgver}.tar.gz)
sha256sums=('475e2bed5486023d19d9e0dec5e109b04b872a9917b62faf83ce3521676f728b')

build() {
  cd "$pkgname-$pkgver"

  ./autogen
  ./configure	\
    --prefix=/usr \
    --enable-release=yes \
    --with-python=/usr/bin/python3
  make -j1
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" MANDIR="/usr/share/man" install
}

# vim:set ts=2 sw=2 et:
