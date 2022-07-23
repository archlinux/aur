# Submitter: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin-git
pkgver=v3.1.0.r0.gf4440fa
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('LGPL3' 'GPL3')
depends=('qtcreator' 'hunspell')
makedepends=('git' 'cmake' 'qtcreator-devel' 'ninja')
source=("$pkgname"::git+https://github.com/CJCombrink/SpellChecker-Plugin.git)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake \
        -G Ninja \
        -S ${srcdir}/${pkgname}\
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
