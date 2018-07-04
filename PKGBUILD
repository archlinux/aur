# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

pkgname=qtcreator-spellchecker-plugin-git
pkgver=r196.cd54877
pkgrel=1
pkgdesc="Spell Checker plugin for the Qt Creator IDE"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="https://github.com/CJCombrink/SpellChecker-Plugin"
license=('GPL3')
depends=('qtcreator' 'hunspell')
makedepends=('git' 'qtcreator-src')
source=("$pkgname"::git+https://github.com/CJCombrink/SpellChecker-Plugin.git)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    # use the revision count.hash
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

    QTC_SOURCE=/usr/src/qtcreator QTC_BUILD=build qmake \
        "LIBS+=-L/usr/lib/qtcreator/ -L/usr/lib/qtcreator/plugins"
    make
}

package() {
    cd "${srcdir}/${pkgname}"

    make INSTALL_ROOT="${pkgdir}/usr" install
}
