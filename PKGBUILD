# Submitter: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin-git
pkgver=v3.1.2.r0.g6449d12
pkgrel=3
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt')
arch=('i686' 'x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL3' 'GPL3')
depends=('qtcreator' 'hunspell')
provides=('qtcreator-spellchecker-plugin')
conflicts=('qtcreator-spellchecker-plugin' 'qtcreator-spellchecker-plugin-bin')
makedepends=('git' 'cmake' 'qtcreator-devel')
source=("$pkgname"::git+${url}.git)
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake \
        -S ${pkgname}\
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
