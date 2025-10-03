# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_ocamlname=mirage-kv
pkgname=ocaml-${_ocamlname}
pkgver=6.1.1
pkgrel=1
pkgdesc="MirageOS signature for key/value stores"
arch=('x86_64')
url="https://github.com/mirage/mirage-kv"
license=('ISC')
depends=(
    'glibc'
    'ocaml'
    'ocaml-fmt'
    'ocaml-lwt'
    'ocaml-optint'
    'ocaml-ptime'
)
makedepends=('dune')
checkdepends=('ocaml-alcotest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mirage/mirage-kv/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('e4c39b536c3d6c9debc7278678e2d2eef82908de087f1fa5788ff19ffb1f962854eb414295c741d68605490ac400ee283cd016dbd9c1f2ad63d3991c81ff6b8a')
options=('!strip')

build() {
    cd $srcdir/$_ocamlname-$pkgver
    dune build -p $_ocamlname
}

check() {
    cd $srcdir/$_ocamlname-$pkgver
    dune test
}

package() {
    cd $srcdir/$_ocamlname-$pkgver
    DESTDIR=$pkgdir dune install --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"

    install -d $pkgdir/usr/share/licenses/$pkgname/
    mv $pkgdir/usr/share/doc/$_ocamlname/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/
    mv $pkgdir/usr/share/doc/$_ocamlname $pkgdir/usr/share/doc/$pkgname
}
