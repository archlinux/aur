# Maintainer: Leonard de Ruijter <alderuijter@gmail.com>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Justin Davis <jrcd 83 at gmail>

pkgname=ocaml-yojson
_oname=yojson
pkgver=1.3.2
pkgrel=2
pkgdesc='An optimized parsing and printing library for JSON'
arch=('i686' 'x86_64')
options=('!strip' 'staticlibs')
license=('BSD')
depends=('ocaml-biniou' 'ocaml-easy-format')
makedepends=('ocaml-findlib' 'cppo')
url='http://mjambon.com/yojson.html'
source=("https://github.com/mjambon/${_oname}/archive/v${pkgver}.tar.gz")
options=(!makeflags)
sha256sums=('eff510621efd6dcfb86b65eaf1d4d6f3b9b680143d88e652b6f14072523a2351')
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
