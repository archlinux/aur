# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin
pkgver=3.12.1
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL-3.0-only' 'GPL-3.0-only')
_qtcreator_ver='19.0.0'
depends=(
    "qtcreator>=$_qtcreator_ver"
    'hunspell' # Don't know why upstream binary does not link to hunspell but this does.
)
makedepends=(
    'cmake'
    "qtcreator-devel>=$_qtcreator_ver"
)
source=("$pkgname-$pkgver.tar.gzr::${url}/archive/v$pkgver.tar.gz")
sha256sums=('1a26f8cafc9e5e41e95608adf094b3c18572f9de0255b1f54822fb588c46fdda')

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
