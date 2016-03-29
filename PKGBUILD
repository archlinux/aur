# Maintainer: Leonard de Ruijter <alderuijter@gmail.com>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Justin Davis <jrcd 83 at gmail>

pkgname=ocaml-biniou
_oname=biniou
pkgver=1.0.10
pkgrel=1
pkgdesc='A binary data serialization format inspired by JSON'
arch=('i686' 'x86_64')
options=('!strip' '!makeflags' 'staticlibs')
license=('BSD')
depends=('glibc')
makedepends=('ocaml-easy-format' 'ocaml-findlib')
url='http://mjambon.com/biniou.html'
source=("https://github.com/mjambon/${_oname}/archive/v${pkgver}.tar.gz")
sha256sums=('239f046b9edd07256a2001c78c70dd97fc7dfca8c7a999153eee729867c79bad')
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
