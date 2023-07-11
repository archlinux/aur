# Maintainer: Carsten Schlote <carsten.schlote@gmail.com>

pkgname='plantumlqeditor-va-git'
pkgver='3.2_20230704'
pkgrel=5
pkgdesc='PlantUML QEditor is a simple editor written in Qt5 for PlantUML (vahanus fork)'
arch=('any')
url='https://github.com/cschlote/plantumlqeditor'
license=('GPL3')
depends=('qt5-webengine' 'plantuml' 'qt5-base' 'graphviz')
conflicts=('plantumlqeditor-git')
install="$pkgname".install
source=('git+https://github.com/cschlote/plantumlqeditor.git')
md5sums=('SKIP')

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
    mkdir -p "$pkgdir"/usr/share/applications/plantumlqeditor
    mkdir -p "$pkgdir"/usr/share/applications/plantumlqeditor/icons
    mkdir -p "$pkgdir"/usr/share/icons/hicolor/32x32/apps
    mkdir -p "$pkgdir"/usr/share/icons/hicolor/48x48/apps
    mkdir -p "$pkgdir"/usr/share/icons/hicolor/64x64/apps

    cp assistant.xml "$pkgdir"/usr/share/applications/plantumlqeditor/assistent.xml
    cp icons/*.svg "$pkgdir"/usr/share/applications/plantumlqeditor/icons/

    cp plantumlqeditor.desktop "$pkgdir"/usr/share/applications/plantumlqeditor.desktop

    cp icon32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/plantumlqeditor.png
    cp icon48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/plantumlqeditor.png
    cp icon64.png "$pkgdir"/usr/share/icons/hicolor/64x64/apps/plantumlqeditor.png
}
