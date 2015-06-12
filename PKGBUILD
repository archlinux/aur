# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Jakob Nixdorf <flocke@shadowice.org>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=camlidl
pkgver=1.05
pkgrel=5
pkgdesc="A stub code generator and COM binding for Objective Caml (OCaml)"
arch=('i686' 'x86_64')
url="http://caml.inria.fr/pub/old_caml_site/camlidl/"
license=('custom')
depends=('ocaml')
options=(staticlibs)
source=(http://caml.inria.fr/pub/old_caml_site/distrib/bazar-ocaml/$pkgname-$pkgver.tar.gz
        arch-build-system-fix.patch
        META.camlidl)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 -i ${srcdir}/arch-build-system-fix.patch

  cp config/Makefile.unix config/Makefile

  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  local _ocamldir=$(ocamlc -where)
  mkdir -p ${pkgdir}/usr/bin ${pkgdir}/${_ocamldir}/{caml,${pkgname}}
  
  make DESTDIR=${pkgdir} install

  install -Dm644 ${srcdir}/META.camlidl ${pkgdir}/${_ocamldir}/${pkgname}/META
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('4cfb863bc3cbdc1af2502042c45cc675'
         '050c117fbddf73e7f7ca64cf1c17c644'
         'c8239780b7303f02b86ca6efc644640c')
sha1sums=('2a0d5ba70fea8c1de1c5387f8b2058357b2177df'
          'a7869f04e83a279ad8327f7cade60b1e470cd24a'
          'cdabd68036a1f52c8ba8cfb22bde5a034ff8b620')
