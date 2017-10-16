# Maintainer: Leonard de Ruijter <dev@systeemdenker.nl>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Justin Davis <jrcd 83 at gmail>

pkgname=ocaml-biniou
_oname=biniou
pkgver=1.0.12
pkgrel=1
pkgdesc='A binary data serialization format inspired by JSON'
arch=('i686' 'x86_64' 'armv7h')
options=('!strip' '!makeflags' 'staticlibs')
license=('BSD')
depends=('glibc')
makedepends=('ocaml-easy-format' 'ocaml-findlib' 'ocamlbuild')
url='http://mjambon.com/biniou.html'
source=("https://github.com/mjambon/${_oname}/archive/v${pkgver}.tar.gz")
sha256sums=('b946e720d94d524b95bb0401d9e47a971e9234df808fe5f12601140ab09ec686')
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
