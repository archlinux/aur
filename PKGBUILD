# Maintainer: TheBill2001 <tuantran1632001@gmail.com>

pkgname=reflex-lexer
pkgver=3.4.1
pkgrel=1
pkgdesc="RE/flex is the regex-centric, fast lexical analyzer generator for C++ with full Unicode support."
arch=('x86_64') # The program seems to be able to be compiled for ARM (based on pull#181) but I can find any document about it.
url="https://github.com/Genivia/RE-flex"
license=('BSD 3-Clause')
makedepends=('gcc')
optdepends=(
    'pcre2: To use PCRE2 as a regex engine'
    'boost: To use Boost.Regex as a regex engine'
    'graphviz: To visualize the FSM graphs'
)
provides=("reflex" "${pkgname}")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b974c628d30775638e4f530e8c10768df2b2b789735e2599ab9d8a8cc431ceda')

build() {
    cd "RE-flex-${pkgver}"

    ./configure --prefix=${pkgdir}/usr
    make
}

package() {
    cd "RE-flex-${pkgver}"

    make install
    install -D "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mv "${pkgdir}/usr/bin/reflex" "${pkgdir}/usr/bin/${pkgname}"
}
