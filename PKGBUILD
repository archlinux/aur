# Maintainer: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Packager: Justin Davis <jrcd 83 at gmail>

pkgname=ocaml-biniou
_oname=biniou
pkgver=1.0.9
pkgrel=1
pkgdesc='A binary data serialization format inspired by JSON'
arch=('i686' 'x86_64')
options=('!strip' '!makeflags' 'staticlibs')
license=('BSD')
depends=('glibc')
makedepends=('ocaml-easy-format' 'ocaml-findlib')
url='http://mjambon.com/biniou.html'
source=("http://mjambon.com/releases/${_oname}/${_oname}-${pkgver}.tar.gz")
md5sums=('2f9f355281817912ac04c589eb463ef2')
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
