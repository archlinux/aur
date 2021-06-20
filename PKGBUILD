# Maintainer: Omar Sandoval <osandov at osandov dot com>
# Contributor: Roger Zanoni <rogerzanoni@gmail.com>
# Contributor: Sylvain Henry <hsyl20@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Dan McGee <dpmcgee@gmail.com>
# Contributor: LeCrayonVert <sunrider@laposte.net>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vladimir Kirillov <proger@wilab.org.ua>

pkgname=coccinelle
pkgver=1.1.0
pkgrel=1
pkgdesc="Provides spatch program used to apply semantic patches"
arch=('i686' 'x86_64')
url="http://coccinelle.lip6.fr/"
license=('GPL2')
makedepends=('ocaml' 'ocaml-findlib' 'ocaml-num')
depends=('pcre' 'python')
optdepends=('ocaml: OCaml scripting feature'
            'ocaml-findlib: OCaml scripting feature')
options=('!strip')
source=(https://github.com/coccinelle/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('e40bdd51eda84f9bf3154c592ebb4af73a4dd9656c03e7ca1d3aa0247d98d185')

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
