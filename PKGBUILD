# Maintainer: Franck Stauffer <franck.stauffer@protonmail.ch>
# Contributor: Whovian9369 <Whovian9369 at gmail dot com>
# Contributor: mock <nobody at nowhere dot co dot uk>

pkgname=clrmamepro
pkgver=4.046
pkgrel=1
pkgdesc="A ROM manager for MAME."
arch=('x86_64' 'i686')
url="https://mamedev.emulab.it/clrmamepro/"
license=('custom')
depends=('wine' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('icoutils')
source=("https://mamedev.emulab.it/clrmamepro/binaries/cmp${pkgver//./}_32.zip"
        "clrmamepro"
        "clrmamepro.desktop")
b2sums=('0ec6a8eabc9f201422860ed5943d765affaee9cb4ba84937ca711468f7405600af2d86478db9200940d8ca97e34fc40c926fdc32dc1ebefafcdf731d3789e8ed'
        '92136aa1e3e5e98d5f5918f047e53a89d09318946fb20c8731a3ce84ff08abd00d65b4e6a098f71792da597677532e9c51cebb7b427594ea5d80260a43d7e147'
        '001f96fd4d515e3501239781be80c71e32b8e5dc9c0f42b2d50794f23ba48206ab669a6348dcd22e6c37d0fddd52758844abbad40aa536c1ad59f99861567265')

build() {
  wrestool -x -n 500 -o . cmpro.exe
  icotool -x -o . cmpro.exe_14_500_1031.ico
}

package() {
  install -Dm644 -t "${pkgdir}/usr/share/clrmamepro/" "7z_32.dll" \
    "engine.cfg" \
    "unrar.dll" \
    "update.dll" \
    "cmpro.exe" \
    "stats.ini" \
    "urls.ini" \
    "version.ini" \
    "setformat.xml"

  install -Dm755 "clrmamepro" "${pkgdir}/usr/bin/clrmamepro"

  install -Dm644 "clrmamepro.desktop" "${pkgdir}/usr/share/applications/clrmamepro.desktop"

  install -Dm644 "cmpro.exe_14_500_1031_4_16x16x32.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/clrmamepro.png"
  install -Dm644 "cmpro.exe_14_500_1031_5_32x32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/clrmamepro.png"
  install -Dm644 "cmpro.exe_14_500_1031_6_48x48x32.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/clrmamepro.png"

  install -Dm644 "copyright.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
