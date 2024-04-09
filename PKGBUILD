# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin
pkgver=3.5.0
pkgrel=2
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL-3.0-only' 'GPL-3.0-only')
depends=(
    'qtcreator>=12.0.0' 'qtcreator<13.0.0'
    'hunspell'
)
makedepends=(
    'qtcreator-devel>=12.0.0' 'qtcreator-devel<13.0.0'
    'cmake'
)
source=("$pkgname-$pkgver::${url}/archive/v$pkgver.tar.gz")
sha256sums=('d780fd90fee09c48c3162cd37e3e0f191bcedfe5805601c1f5728909960d38d3')

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
