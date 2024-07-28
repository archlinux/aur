# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin
pkgver=3.7.0
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL-3.0-only' 'GPL-3.0-only')
depends=(
    'qtcreator>=14.0.0' 'qtcreator<15.0.0'
    'hunspell' # Don't know why upstream binary does not link to hunspell but this does.
)
makedepends=(
    'cmake'
    'qtcreator-devel>=14.0.0' 'qtcreator-devel<15.0.0'
)
source=("$pkgname-$pkgver.tar.gzr::${url}/archive/v$pkgver.tar.gz")
sha256sums=('d8a07557096ff9f6e5618301056912779ee63a603b2e95996fb30b781751888a')

build() {
    cmake \
        -S SpellChecker-Plugin-$pkgver\
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
