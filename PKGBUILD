# Maintainer: Zineddine SAIBI <saibi.zineddine@yahoo.com>

pkgname=deeptags
pkgver=0.7
pkgrel=1
pkgdesc="A Markdown notes manager"
arch=('x86_64')
url="https://github.com/SZinedine/DeepTags"
license=('GPL3')
depends=('qt5-base' 'qt5-svg')
makedepends=('qt5-tools' 'git' 'gcc' 'make')
source=("$pkgname::git+https://github.com/SZinedine/DeepTags.git#tag=$pkgver")
md5sums=('SKIP')
conflicts=("deeptags-git")
install=$pkgname.install

build() {
    cd "$pkgname"
    git submodule update --init --recursive
    qmake PREFIX=/usr
    make
}

package() {
    cd $pkgname/
    make INSTALL_ROOT=$pkgdir install

    install -Dm 644 packaging/resources/$pkgname.appdata.xml    $pkgdir/usr/share/metainfo/$pkgname.appdata.xml;
    install -Dm 644 packaging/resources/$pkgname.desktop        $pkgdir/usr/share/applications/$pkgname.desktop
    install -Dm 644 LICENSE                                     $pkgdir/usr/share/licenses/$pkgname/LICENSE

    for icon in 16x16 32x32 48x48 64x64 80x80 96x96 128x128 192x192 256x256 384x384 512x512; do
        install -Dm 644 packaging/resources/icons/hicolor/$icon/apps/$pkgname.png  $pkgdir/usr/share/icons/hicolor/$icon/apps/$pkgname.png
    done
    install -Dm 644 packaging/resources/icons/hicolor/scalable/apps/$pkgname.svg   $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg


}
