pkgname=graph-plotter-hg
_pkgname=graph-plotter-code
pkgver=r164+.6c3c03cb02f6+
pkgrel=1
pkgdesc="GP is aimed to be simple and fast tool to analyse numerical data. It does not claim to replace all other plotters."
arch=('x86_64')
url="https://sourceforge.net/projects/graph-plotter/"
license=('GPL3')
depends=('sdl2_image' 'sdl2_ttf' 'ttf-hack')
makedepends=('mercurial')
source=("${_pkgname}"::'hg+http://hg.code.sf.net/p/graph-plotter/code' 'graph-plotter-ttf-hack.patch')
#hg clone http://hg.code.sf.net/p/graph-plotter/code graph-plotter-code
sha256sums=('SKIP'
            '5068d2fd324fa7a268dc07bcf93362107f68a90da29092bb8bcbb28dab1c45c9')
pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
prepare() {
    patch -Np0 -i "graph-plotter-ttf-hack.patch"
}
build() {
    cd "${_pkgname}/src"
    make -e 'BUILD=./tmp/gp'
}
package() {
    install -Dm755  "${_pkgname}/src/tmp/gp/gp" "$pkgdir/usr/bin/gp"
}
