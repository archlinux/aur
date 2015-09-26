# Maintainer: Martchus <martchus@gmx.net>
# decide whether to link against the deprecated Qt WebKit module (in qt5-webkit package ~40 MB) or
# the newer, chromium-based Qt WebEngine module (in qt5-webengine package ~100 MB)
_webviewprovider=qt5-webkit
pkgname=tageditor
pkgver=1.1.5
pkgrel=11
arch=('i686' 'x86_64')
pkgdesc="A tag editor with Qt GUI and command-line interface supporting MP4 (iTunes), ID3, Vorbis and Matroska."
license=('GPL')
depends=('qt5-script' $_webviewprovider 'qtutilities' 'tagparser' 'desktop-file-utils' 'xdg-utils')
makedepends=('qt5-tools')
install=${pkgname}.install
url="https://github.com/Martchus/tageditor"
source=("tageditor-${pkgver}.tar.gz::https://github.com/Martchus/tageditor/archive/v${pkgver}.tar.gz")
_reponame=tageditor
sha256sums=('bea7177c03e7594a277f8f95bf3d13519b466c9c98f3f234a33923104cb1f11e')

build() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    cfg=()
    if [[ _webviewprovider == qt5-webkit ]]; then
        cfg+=(forcewebkit)
    fi
    INSTALL_ROOT=$pkgdir/usr/ qmake-qt5 "$pkgname.pro" $(for val in "${cfg[@]}"; do echo -n "CONFIG+=$val "; done)
    make
}

package() {
    cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
    make install
}
