# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Jakob Nixdorf <flocke@shadowice.org>
# Contributor: Bertram Felgenhauer <int-e@gmx.de>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=camlidl
pkgver=1.05
pkgrel=7
pkgdesc="A stub code generator and COM binding for Objective Caml (OCaml)"
arch=('i686' 'x86_64')
url="https://github.com/xavierleroy/camlidl"
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

sha1sums=('2a0d5ba70fea8c1de1c5387f8b2058357b2177df'
          'b5cf6873bda3fe48f9946f09ccea39cd60fda59c'
          '19e42c60e2e7448951fc87bb70a3e8fb26244e08'
          '2e26acb071e62574ced84ff7aa3a7164e27daef0')
sha256sums=('857ed5bd3b2f99c62813070e1a5b4b6375e837c6815f4ad956baeb6f8c660311'
            '4b5a3495db307970fef1e408e1e5caa92c3d3fde5c5fafe81b6d679662ab688c'
            '78646a2022617e484b48aa7a5f7aa322696639b8b1eb195f07e88eb143dd735d'
            '1a060499f884670ad3ad5f9dbd8421ea3754947b0ee955424490848acb39ce42')
