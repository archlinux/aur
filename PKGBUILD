# Maintainer: Omar Sandoval <osandov at osandov dot com>
# Contributor: Roger Zanoni <rogerzanoni@gmail.com>
# Contributor: Sylvain Henry <hsyl20@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Dan McGee <dpmcgee@gmail.com>
# Contributor: LeCrayonVert <sunrider@laposte.net>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vladimir Kirillov <proger@wilab.org.ua>

pkgname=coccinelle
pkgver=1.0.5
pkgrel=2
pkgdesc="Provides spatch program used to apply semantic patches"
arch=('i686' 'x86_64')
url="http://coccinelle.lip6.fr/"
license=('GPL2')
makedepends=('camlp4' 'ocaml' 'ocaml-findlib' 'texlive-core' 'texlive-fontsextra')
depends=('pcre' 'python')
optdepends=('ocaml: OCaml scripting feature'
            'ocaml-findlib: OCaml scripting feature')
options=(!strip)
source=(http://coccinelle.lip6.fr/distrib/${pkgname}-${pkgver}.tgz)
sha256sums=('5efb093b538145b7526a06946c09c7caaa715006658af2049faa8739f459743b')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make -j1
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" MANDIR="/usr/share/man" install
  install -m755 -d "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 -D docs/manual/*.pdf "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
