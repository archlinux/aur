# Maintainer: Martchus <martchus@gmx.net>
# decide whether to link against the deprecated Qt WebKit module (in qt5-webkit package ~40 MB) or
# the newer, chromium-based Qt WebEngine module (in qt5-webengine package ~100 MB)
_webviewprovider=qt5-webkit
pkgname=tageditor
pkgver=1.2.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A tag editor with Qt GUI and command-line interface supporting MP4 (iTunes), ID3, Vorbis and Matroska."
license=('GPL')
depends=('qt5-script' $_webviewprovider 'qtutilities' 'tagparser' 'desktop-file-utils' 'xdg-utils')
makedepends=('qt5-tools')
install=${pkgname}.install
url="https://github.com/Martchus/tageditor"
source=("tageditor-${pkgver}.tar.gz::https://github.com/Martchus/tageditor/archive/v${pkgver}.tar.gz")
_reponame=tageditor
sha256sums=('42b0c89667069007aec6b2e04f9bd5479c95c601f4d42c0bfd5d8fc5210fb10d')

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
