# Maintainer: Tom Bebbington <tophattedcoder@gmail.com>

_pkgbase='citra'
pkgbase="$_pkgbase-nightly-bin"
pkgname=("$_pkgbase-nightly-bin" "$_pkgbase-qt-nightly-bin")
pkgrel=2
pkgver="70_20170218_e594e63"
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger"
provides=('citra' 'citra-qt')
builddepends=('curl')
license=('GPL')
arch=('x86_64')
url="https://github.com/citra-emu/citra-nightly/"
id="$(echo $pkgver | cut -d'_' -f2)-$(echo $pkgver | cut -d'_' -f3)"
source=(
    "https://github.com/citra-emu/citra-nightly/releases/download/nightly-$(echo $pkgver | cut -d'_' -f1)/citra-linux-$id.tar.xz"
    "https://raw.githubusercontent.com/citra-emu/citra/master/dist/citra.desktop"
    "https://raw.githubusercontent.com/citra-emu/citra/master/dist/citra.svg"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

package_citra-nightly-bin() {
	depends=('sdl2' 'libpng' 'libpng12')

    cd $srcdir/citra-linux-$id
    mkdir -p "${pkgdir}/usr/bin"
    mv citra "${pkgdir}/usr/bin"
}
package_citra-qt-nightly-bin() {
	depends=('qt5-base' 'shared-mime-info' 'desktop-file-utils')
	optdepends=('libxkbcommon-x11: for X11 support'
	            'qt5-wayland: for Wayland support')


    cd $srcdir/citra-linux-$id
    mkdir -p $pkgdir/usr/bin
    mv citra-qt $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/applications
    cp $srcdir/citra.desktop $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/pixmaps
    cp $srcdir/citra.svg $pkgdir/usr/share/pixmaps
}