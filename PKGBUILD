# Maintainer: Juan Simón <play4pro at protonmail dot com>
# Contributor: Giusy Digital <kurmikon AT libero DOT it>

_pkgbasename=mediainfo-gui
pkgname=mediainfo-gui-qt
pkgver=22.12
pkgrel=2
pkgdesc="Supplies technical and tag information about a video or audio file (Qt GUI interface)"
arch=("i686" "x86_64")
url="https://github.com/MediaArea/MediaInfo"
license=("BSD")
depends=("libmediainfo" "qt5-base" "hicolor-icon-theme")
makedepends=("glibc")
provides=("$_pkgbasename")
conflicts=("$_pkgbasename")
source=("$pkgname-$pkgver.tar.gz::https://github.com/MediaArea/MediaInfo/archive/v$pkgver.tar.gz"
    "kde4-service.desktop" "konqueror-service.desktop" "kservices5.desktop")
sha256sums=('c307462c692e4e8e674bf56bf198f4247d58bfbb43868ed8aa2ea2f9f12193ec'
            '3c6b9a9f798c18a7dbed17eccafb06d4f417393eeba255947009bae25aa32e47'
            '6c448929c66a96badfd66d347eaf0d28ad935bf1e33210f08cda75fe4295592f'
            'a10fd186aa786bb6ae45013fe092a2a2959fdbdddebad70ae5ffc031409dd6a7')

build() {
    cd "$srcdir/MediaInfo-$pkgver/Project/QMake/GUI"
    qmake "MediaInfoQt.pro"
    make
}

package() {
    cd "$srcdir"
    install -Dm644 "kde4-service.desktop" \
        "$pkgdir/usr/share/kde4/services/ServiceMenus/$_pkgbasename.desktop"
    install -Dm644 "konqueror-service.desktop" \
        "$pkgdir/usr/share/apps/konqueror/servicemenus/$_pkgbasename.desktop"
    install -Dm644 "kservices5.desktop" \
        "$pkgdir/usr/share/kservices5/ServiceMenus/$_pkgbasename.desktop"
    
    cd "MediaInfo-$pkgver"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "Source/Resource/Image/MediaInfo.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/mediainfo.svg"
    install -Dm644 "Project/GNU/GUI/$_pkgbasename.desktop" \
        "$pkgdir/usr/share/applications/$_pkgbasename.desktop"
        
    cd "Project/QMake/GUI"
    make INSTALL_ROOT="$pkgdir" install
}
