# Maintainer: Omar Sandoval <osandov at osandov dot com>
# Contributor: Roger Zanoni <rogerzanoni@gmail.com>
# Contributor: Sylvain Henry <hsyl20@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Dan McGee <dpmcgee@gmail.com>
# Contributor: LeCrayonVert <sunrider@laposte.net>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vladimir Kirillov <proger@wilab.org.ua>

pkgname=coccinelle
pkgver=1.1.1
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
source=(https://github.com/coccinelle/${pkgname}/archive/${pkgver}.tar.gz
        0001-Fix-263-wrong-default-path-for-COCCINELLE_HOME.patch)
sha256sums=('095919e129ac563586d880ebbc5aac829fec224177090aebe34dc34ed5f142bf'
            '9c52674ba49f9789d1a88df54a453835aa1f4b4645a9b770d3231a05bc3b22c7')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 < "$srcdir/0001-Fix-263-wrong-default-path-for-COCCINELLE_HOME.patch"
}

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
