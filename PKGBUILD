# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=qtcreator-spellchecker-plugin
pkgname=${_pkgname}-git
pkgver=3.6.0.r0.g5460316
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL-3.0-only' 'GPL-3.0-only')
depends=(
    'qtcreator'
    'hunspell'
)
makedepends=(
    'git'
    'cmake'
    'qtcreator-devel'
)
provides=('qtcreator-spellchecker-plugin')
conflicts=('qtcreator-spellchecker-plugin')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake \
        -S "${_pkgname}"\
        -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_PREFIX_PATH="/usr/lib/cmake/Qt6" \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
