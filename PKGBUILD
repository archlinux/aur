# Maintainer: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Sylvester Johansson <scj(at)archlinux(dot)us>
pkgname=ocaml-zip
pkgver=1.08
_pkgver=rel108
pkgrel=1
pkgdesc="ZIP and gzip library for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/xavierleroy/camlzip"
license=('GPL')
depends=('ocaml' 'zlib')
makedepends=('ocaml-findlib')
options=(!strip staticlibs)
source=("https://github.com/xavierleroy/camlzip/archive/$_pkgver.tar.gz")
md5sums=('a2a394a39ad96c3b2e2a9a6f5197a2e3')

build() {
  cd "$srcdir/camlzip-$_pkgver"

  make all allopt
  mkdir -p html
  ocamldoc -html -d html gzip.mli zip.mli
}

package() {
  cd "$srcdir/camlzip-$_pkgver"

  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  export OCAMLFIND_LDCONF="ignore"

  mkdir -p "$OCAMLFIND_DESTDIR/stublibs"
  make install-findlib
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -d -m 0755 "${pkgdir}/usr/share/doc/$pkgname"
  install -t "${pkgdir}/usr/share/doc/$pkgname/" html/*
}
