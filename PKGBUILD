# Maintainer: Tom Bebbington <tophattedcoder@gmail.com>

_pkgbase='citra'
pkgbase="$_pkgbase-nightly-bin"
pkgname=("$_pkgbase-nightly-bin" "$_pkgbase-qt-nightly-bin")
pkgrel=7
pkgver=1330_20190812_2f0ea48
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger"
provides=('citra' 'citra-qt')
license=('GPL')
arch=('x86_64')
url="https://github.com/citra-emu/citra-nightly/"
_nightly_id=$(echo $pkgver | cut -d'_' -f1)
_ref="$(echo $pkgver | cut -d'_' -f2)-$(echo $pkgver | cut -d'_' -f3)"

source=(
    "https://github.com/citra-emu/citra-nightly/releases/download/nightly-$_nightly_id/citra-linux-$_ref.tar.xz"
    "https://raw.githubusercontent.com/citra-emu/citra/master/dist/citra.desktop"
    "https://raw.githubusercontent.com/citra-emu/citra/master/dist/citra.svg"
    "citra.bash"
    "citra-qt.bash"
)
sha256sums=('77a1305e96a401d8e2671e36cbfed7e5913e9eb0eba35a17a32ee8651ad80e40'
            '93bd8f799877eba7dd87ed7a4c29607d78c42b8769626c1d479f7e34fb7b39e2'
            'eeab12f3f13f06db7984d361eebcd977ce500b1f73c9bd7ce726712d477e6e14'
            '068409ef70c25e8da3f0430c5ff62609d122f2f857525940da8cd792a228a822'
            '61bcee69be306b58fd0bdf6327cdfc88260ba9f9d0694cf54e2d720965bc918b')

package_citra-nightly-bin() {
	depends=('sdl2' 'libpng' 'libpng12' 'libcurl-compat' 'bash')

    mkdir -p "${pkgdir}/usr/bin"
    cp $srcdir/citra.bash "${pkgdir}/usr/bin/citra"
    cd $srcdir/citra-linux-$_ref
    mkdir -p "${pkgdir}/opt/citra"
    cp citra "${pkgdir}/opt/citra"
}
package_citra-qt-nightly-bin() {
	depends=('qt5-base' 'shared-mime-info' 'desktop-file-utils' 'libcurl-compat' 'bash')
	optdepends=('libxkbcommon-x11: for X11 support'
	            'qt5-wayland: for Wayland support')

    mkdir -p $pkgdir/usr/bin
    cp $srcdir/citra-qt.bash "${pkgdir}/usr/bin/citra-qt"
    cd $srcdir/citra-linux-$_ref
    mkdir -p $pkgdir/opt/citra
    mv citra-qt $pkgdir/opt/citra
    mkdir -p $pkgdir/usr/share/applications
    cp $srcdir/citra.desktop $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/pixmaps
    cp $srcdir/citra.svg $pkgdir/usr/share/pixmaps
}
