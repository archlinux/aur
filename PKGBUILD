# Maintainer: Christopher Price <pricechrispy at gmail dot com>
pkgname=tiny_httpd
pkgver=0.16
pkgrel=1
pkgdesc='Minimal HTTP server'
arch=('x86_64')
url='https://c-cube.github.io/tiny_httpd'
license=('MIT')
depends=(
'ocaml>=4.08.0'
)
makedepends=(
'dune'
'ocaml-seq'
'ocaml-findlib'
)
options=('!strip' 'staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/c-cube/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4077eb1e964671d51fb939687bd28320bff73198078e9ad497f0670240fd19bf')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export OCAMLPATH="$(ocamlfind printconf destdir)"

    dune build -p "$pkgname"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    dune install "$pkgname" --destdir="${pkgdir}" --prefix="/usr" --libdir="$(ocamlfind printconf destdir)"

    install -dm755 "${pkgdir}/usr/share/"

    mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
