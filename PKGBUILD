# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Jakob Nixdorf <flocke@shadowice.org>
# Contributor: Bertram Felgenhauer <int-e@gmx.de>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=camlidl
pkgver=1.05
pkgrel=6
pkgdesc="A stub code generator and COM binding for Objective Caml (OCaml)"
arch=('i686' 'x86_64')
url="http://caml.inria.fr/pub/old_caml_site/camlidl/"
license=('custom')
depends=('ocaml')
options=(staticlibs)
source=(http://caml.inria.fr/pub/old_caml_site/distrib/bazar-ocaml/$pkgname-$pkgver.tar.gz
        arch-build-system-fix.patch
        rename-array-module-for-ocaml-4.03.patch
        META.camlidl)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ${srcdir}/arch-build-system-fix.patch
  patch -Np1 -i ${srcdir}/rename-array-module-for-ocaml-4.03.patch
  cp config/Makefile.unix config/Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
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
         '9b7f92ec77b50d260b6487e4577bd5f0'
         '937930d2b49a6df80567464350cb3fd9'
         'c8239780b7303f02b86ca6efc644640c')
sha1sums=('2a0d5ba70fea8c1de1c5387f8b2058357b2177df'
          'b5cf6873bda3fe48f9946f09ccea39cd60fda59c'
          '19e42c60e2e7448951fc87bb70a3e8fb26244e08'
          'cdabd68036a1f52c8ba8cfb22bde5a034ff8b620')
