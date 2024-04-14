# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin
pkgver=3.6.0
pkgrel=2
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL-3.0-only' 'GPL-3.0-only')
depends=(
    'qtcreator>=13.0.0' 'qtcreator<14.0.0'
    'hunspell' # Don't know why upstream binary does not link to hunspell but this does.
)
makedepends=(
    'cmake'
    'qtcreator-devel>=13.0.0' 'qtcreator-devel<14.0.0'
    'syntax-highlighting' # This might not be needed in the future version of qtcreator-devel
)
source=("$pkgname-$pkgver.tar.gzr::${url}/archive/v$pkgver.tar.gz")
sha256sums=('3887679e5cade0eea876ca413472284cad882e09ec2680fb44d761b92e45df94')

build() {
    # This might not be needed in the future version of qtcreator-devel
    export CXXFLAGS="$CXXFLAGS -isystem /usr/include/KF6/KSyntaxHighlighting/"

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
