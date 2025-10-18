# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_ocamlname=fiber
pkgname=ocaml-${_ocamlname}
pkgver=3.7.0
pkgrel=1
pkgdesc="Dune's monadic structured concurrency library"
arch=('x86_64')
url="https://github.com/ocaml-dune/fiber"
license=('MIT')
depends=('ocaml')
makedepends=('dune')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ocaml-dune/fiber/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('b3df6c27fd4e927e38997e0b90253c96a93632a13ab2aefb6c0ed0d396f17951b3a55dc2015b8c0a5fe5a2fb5270baf697982680de7461a8daaf8cbd5d0e14c7')
options=('!strip')

build() {
    cd $srcdir/$_ocamlname-$pkgver
    dune build -p $_ocamlname
}

# Doesn't work with recent ocaml-ppx_expect
# check() {
#     cd $srcdir/$_ocamlname-$pkgver
#     dune test
# }

package() {
    cd $srcdir/$_ocamlname-$pkgver
    DESTDIR=$pkgdir dune install -p ${_ocamlname} --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"

    install -d $pkgdir/usr/share/licenses/$pkgname/
    mv $pkgdir/usr/share/doc/$_ocamlname/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/
    mv $pkgdir/usr/share/doc/$_ocamlname $pkgdir/usr/share/doc/$pkgname
}
