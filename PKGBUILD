# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_srcname='ISO8601'
_projectname="${_srcname}.ml"
pkgname=ocaml-iso8601
pkgver=0.2.6
pkgrel=2
pkgdesc="ISO 8601 and RFC 3339 date parsing for OCaml"
url="https://ocaml-community.github.io/ISO8601.ml"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ocaml-community/ISO8601.ml/archive/refs/tags/${pkgver}.tar.gz")
depends=('glibc' 'ocaml')
makedepends=('dune' 'ocaml')
arch=('x86_64')
b2sums=('SKIP')

build() {
    cd "${srcdir}/${_projectname}-${pkgver}"
    dune build --release
}

package() {
    cd "${srcdir}/${_projectname}-${pkgver}"

    DESTDIR="${pkgdir}" dune install \
	   --prefix "/usr" \
	   --libdir "/usr/lib/ocaml" \
	   --docdir "/usr/share/doc" \
	   --release

    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    mv $pkgdir/usr/share/doc/$_srcname/LICENSE "$pkgdir/usr/share/licenses/$pkgname"

    mv $pkgdir/usr/share/doc/$_srcname $pkgdir/usr/share/doc/$pkgname
}
