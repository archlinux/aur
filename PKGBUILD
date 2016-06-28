# Maintainer: Tom Bebbington <tophattedcoder@gmail.com>

_pkgbase='citra'
pkgbase="$_pkgbase-nightly-bin"
pkgname=("$_pkgbase-nightly-bin" "$_pkgbase-qt-nightly-bin")
pkgrel=1
pkgver=9cde5cb
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger"
provides=('citra' 'citra-qt')
builddepends=('curl')
license=('GPL')
arch=('x86_64')
url="https://github.com/citra-emu/citra/"
source=(
    "https://builds.citra-emu.org/citra/nightly/citra-latest-linux-amd64.tar.xz",
    "https://raw.githubusercontent.com/citra-emu/citra/master/dist/citra.desktop",
    "https://raw.githubusercontent.com/citra-emu/citra/master/dist/citra.png"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

package_citra-nightly-bin() {
	depends=('sdl2' 'libpng')

    cd $srcdir/citra*
    mkdir -p "${pkgdir}/usr/bin"
    mv citra "${pkgdir}/usr/bin"
}
package_citra-qt-nightly-bin() {
	depends=('qt5-base' 'shared-mime-info' 'desktop-file-utils')
	optdepends=('libxkbcommon-x11: for X11 support'
	            'qt5-wayland: for Wayland support')


    cd $srcdir/citra*
    mkdir -p $pkgdir/usr/bin
    cp $srcdir/citra-qt $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/applications
    cp $srcdir/citra.desktop $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/pixmaps
    cp $srcdir/citra.svg $pkgdir/usr/share/pixmaps
}

pkgver() {
  	cd $srcdir/citra*
	echo $(citra -v | cut -d " " -f 3)
}
