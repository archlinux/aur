# Maintainer: Alexey <pozitiffcat2@gmail.com>

pkgname='plantumlqeditor-git'
pkgver='3.0_20180319'
pkgrel=3
pkgdesc='PlantUML QEditor is a simple editor written in Qt5 for PlantUML'
arch=('any')
url='https://github.com/borco/plantumlqeditor'
license=('GPL3')
depends=('qt5-webengine' 'plantuml' 'qt5-base' 'graphviz')
source=('git+https://github.com/borco/plantumlqeditor.git')
md5sums=('SKIP')
install="$pkgname".install

prepare() {
    [[ -d build ]] && rm -r build
    mkdir build
}

build() {
    cd build
    qmake-qt5 "$srcdir"/plantumlqeditor
    make
}

package() {
    cd "$srcdir"/build
    mkdir -p "$pkgdir"/usr/bin/
    cp plantumlqeditor "$pkgdir"/usr/bin/

    cd "$srcdir"/plantumlqeditor
    mkdir -p "$pkgdir"/usr/share/applications/
    mkdir -p "$pkgdir"/usr/share/icons/hicolor/32x32/apps
    mkdir -p "$pkgdir"/usr/share/icons/hicolor/48x48/apps
    mkdir -p "$pkgdir"/usr/share/icons/hicolor/64x64/apps
    cp plantumlqeditor.desktop "$pkgdir"/usr/share/applications/plantumlqeditor.desktop
    cp icon32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/plantumlqeditor.png
    cp icon48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/plantumlqeditor.png
    cp icon64.png "$pkgdir"/usr/share/icons/hicolor/64x64/apps/plantumlqeditor.png
}
