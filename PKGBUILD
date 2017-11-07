# Maintainer: gillux <gillux@example.net>
pkgname=intertext-editor
_pkgname=InterText_editor
_binname=InterText
pkgver=1.6
pkgrel=1
pkgdesc="Editor for aligned parallel texts"
arch=('i686' 'x86_64')
url="http://wanthalf.saga.cz/intertext"
license=('GPLv3')
depends=('qt5-base')
makedepends=('imagemagick')
install=
source=("https://github.com/czcorpus/$_pkgname/archive/v$pkgver.tar.gz"
        "$_binname.desktop")
md5sums=('e7d45e3941cfd6acfda36e6771ed2386'
         '41995ca7398f11b0ffc394e34a327cd6')

_install_icon() {
    local layer=$1 size=$2
    install -Dm644 $_binname-$layer.png "$pkgdir/usr/share/icons/hicolor/$size/apps/$_binname.png"
}

build() {
    cd "$_pkgname-$pkgver"
    qmake-qt5
    make
    convert $_binname.ico $_binname.png
}

package() {
    install -Dm644 $_binname.desktop "$pkgdir/usr/share/applications/$_binname.desktop"

    cd "$_pkgname-$pkgver"
    install -Dm755 $_binname "$pkgdir/usr/bin/$_binname"
    _install_icon 6 48x48
    _install_icon 7 32x32
    _install_icon 8 16x16
    install -Dm644 manual/InterText_Editor-User_Guide.pdf "$pkgdir/usr/share/doc/$_binname/InterText_Editor-User_Guide.pdf"
}
