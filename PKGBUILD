# Maintainer: TheBill2001 <tuantran1632001@gmail.com>

pkgname=reflex-lexer
pkgver=5.0.1
pkgrel=1
pkgdesc="RE/flex is the regex-centric, fast lexical analyzer generator for C++ with full Unicode support."
arch=('x86_64') # The program seems to be able to be compiled for ARM (based on pull#181) but I can't find any document about it.
url="https://github.com/Genivia/RE-flex"
license=('BSD-3-Clause')
makedepends=('gcc' 'make')
optdepends=(
    'pcre2: To use PCRE2 as a regex engine'
    'boost: To use Boost.Regex as a regex engine'
    'graphviz: To visualize the FSM graphs'
)
provides=("libreflex.a" "libreflexmin.a")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b74430fe63a6e3e665676d23601e332fcf12714efb798661bf307cb7a230ca4f')

build() {
    cd "RE-flex-${pkgver}"

    ./configure --prefix=${pkgdir}/usr
    make
}

package() {
    cd "RE-flex-${pkgver}"

    make install
    install -D "LICENSE.txt" "${pkgdir}/usr/share/licenses/reflex/LICENSE"
}
