# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin
pkgver=3.9.0
pkgrel=2
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL-3.0-only' 'GPL-3.0-only')
depends=(
    'qtcreator>=16.0.0'
    'hunspell' # Don't know why upstream binary does not link to hunspell but this does.
)
makedepends=(
    'cmake'
    'qtcreator-devel>=16.0.0'
)
source=("$pkgname-$pkgver.tar.gzr::${url}/archive/v$pkgver.tar.gz")
sha256sums=('50b606dcddbe6c4a37867a31d2bfed2b3d6873120119186dd1954fb323d8617c')

build() {
    cmake \
        -S SpellChecker-Plugin-$pkgver -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_PREFIX_PATH="/usr/lib/cmake/Qt6" \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
