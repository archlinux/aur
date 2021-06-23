pkgname=graph-plotter-hg
_pkgname=graph-plotter-code
pkgver=r196+.96dbba819565+
pkgrel=1
pkgdesc="A simple and very fast tool to view and analyse numerical data (e.g. csv files)"
arch=('x86_64')
url="https://sourceforge.net/projects/graph-plotter/"
# https://www.linux.org.ru/forum/development/15265191
license=('GPL3')
depends=('sdl2_image' 'sdl2_ttf' 'ttf-hack')
makedepends=('mercurial')
source=("${_pkgname}"::'hg+http://hg.code.sf.net/p/graph-plotter/code')
#hg clone http://hg.code.sf.net/p/graph-plotter/code graph-plotter-code
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
    cd "${_pkgname}"
    sed -i 's#/usr/share/fonts/corefonts/cour.ttf#/usr/share/fonts/TTF/Hack-Regular.ttf#g' ./src/gp.c
}

build() {
    cd "${_pkgname}/src"
    make -e 'BUILD=./tmp/gp'
}

package() {
    install -Dm755  "${_pkgname}/src/tmp/gp/gp" "$pkgdir/usr/bin/gp"
}
