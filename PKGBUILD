# Maintainer: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Justin Davis <jrcd 83 at gmail>

pkgname=ocaml-yojson
_oname=yojson
pkgver=1.1.8
pkgrel=2
pkgdesc='An optimized parsing and printing library for JSON'
arch=('i686' 'x86_64')
options=('!strip' 'staticlibs')
license=('BSD')
depends=('ocaml-easy-format')
makedepends=('ocaml-biniou' 'ocaml-findlib' 'cppo')
url='http://mjambon.com/yojson.html'
source=("http://mjambon.com/releases/${_oname}/${_oname}-${pkgver}.tar.gz")
md5sums=('e3c53004f74410c3835d851b02c1bf21')
options=(!makeflags)

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
