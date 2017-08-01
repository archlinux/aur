# Maintainer: Alexey <pozitiffcat2@gmail.com>

pkgname='plantumlqeditor-git'
pkgver='2.1_20170801'
pkgrel=1
pkgdesc='PlantUML QEditor is a simple editor written in Qt5 for PlantUML'
arch=('any')
url='https://github.com/jalbersol/plantumlqeditor'
license=('GPL3')
depends=('plantuml' 'qt5-base' 'qt5-webengine' 'graphviz')
source=('git+https://github.com/jalbersol/plantumlqeditor.git')
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
    cp release/plantumlqeditor "$pkgdir"/usr/bin/

    cd "$srcdir"/plantumlqeditor
    mkdir -p "$pkgdir"/usr/share/applications/
    mkdir -p "$pkgdir"/usr/share/icons/hicolor/32x32/apps
    mkdir -p "$pkgdir"/usr/share/icons/hicolor/48x48/apps
    mkdir -p "$pkgdir"/usr/share/icons/hicolor/64x64/apps
    cp plantumlqeditor.desktop "$pkgdir"/usr/share/applications/plantumlqeditor.desktop
    cp resources/icon32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/plantumlqeditor.png
    cp resources/icon48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/plantumlqeditor.png
    cp resources/icon64.png "$pkgdir"/usr/share/icons/hicolor/64x64/apps/plantumlqeditor.png
}
