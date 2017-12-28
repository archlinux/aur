# Maintainer: nerflad <nerflad@gmail.com>

pkgname=ocaml-yojson
_oname=yojson
pkgver=1.3.3
pkgrel=2
pkgdesc='An optimized parsing and printing library for JSON'
arch=('i686' 'x86_64' 'armv7h')
options=('!makeflags' '!strip' 'staticlibs')
license=('BSD')
depends=('ocaml-biniou' 'ocaml-easy-format')
makedepends=('ocaml-findlib' 'ocamlbuild' 'cppo')
url="https://github.com/mjambon/yojson"
source=("https://github.com/mjambon/${_oname}/archive/v${pkgver}.tar.gz")
sha256sums=('de5ad4fd681f58ae5a670f0a43684873cc6ca50bdf52e63ac0c4b8a8bbe1d51a')
build() {
  cd $srcdir/$_oname-$pkgver
  make && make doc
}

package() {
  cd $srcdir/$_oname-$pkgver
  mkdir -p $pkgdir/usr/bin $pkgdir$(ocamlfind printconf destdir)
  make OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) install BINDIR="${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/doc/$pkgname"
  install -t "${pkgdir}/usr/share/doc/$pkgname" doc/*
}
