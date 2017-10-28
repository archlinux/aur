# Maintainer Sky <sky at gfw dot party>

pkgname=deepin-picker-git
subname=deepin-picker
pkgver=1.1
pkgrel=1
pkgdesc="Color picker tool for deepin."
arch=('any')
url="https://github.com/manateelazycat/deepin-picker"
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'qt5-base')
source=("https://github.com/manateelazycat/deepin-picker/archive/$pkgver.tar.gz")
md5sums=('58baab5b48b51dd326d3cdc85f9fa452')

build() {
    mkdir -p "$srcdir"/"$subname"-"$pkgver"/build
    cd "$srcdir"/"$subname"-"$pkgver"/build
    qmake ..
    make
}

package(){
    cd "$srcdir"/"$subname"-"$pkgver"
    mkdir -p "$pkgdir"/usr/share/deepin-picker/translations
    mkdir -p "$pkgdir"/usr/share/applications
    mkdir -p "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
    #make install DESTDIR="$pkgdir"
    install -Dm0755 build/deepin-picker "$pkgdir"/usr/bin/deepin-picker
    install -Dm0755 translations/* "$pkgdir"/usr/share/deepin-picker/translations
    install -Dm0755 translations/* "$pkgdir"/usr/share/deepin-picker/translations
    install -Dm0755 deepin-picker.desktop "$pkgdir"/usr/share/applications
    install -Dm0755 image/deepin-picker.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
}