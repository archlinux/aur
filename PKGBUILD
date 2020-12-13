# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=maya-bifrost
pkgver=2.2.0.0
pkgrel=1
pkgdesc='Autodesk Maya Bifrost Plugin'
arch=('x86_64')
url='https://area.autodesk.com/bifrost/'
license=('custom')
depends=('attr' 'bzip2' 'double-conversion' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'graphite'
         'harfbuzz' 'icu' 'libgcrypt' 'libglvnd' 'libgpg-error' 'libpng' 'libx11' 'libxau' 'libxcb'
         'libxdmcp' 'lz4' 'md4c' 'ncurses5-compat-libs' 'pcre' 'pcre2' 'qt5-base' 'qt5-svg'
         'systemd-libs' 'tbb' 'util-linux-libs' 'xz' 'zlib' 'zstd' 'maya=2020.4')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://Bifrost2020-$pkgver-$pkgver-1.x86_64.rpm")
sha256sums=('63bfa90674de7ee85645ccaa57ceacb4b2efaf5a80304a158c164b73e08e7112')

options=(!strip)

package() {
    # Patch & Copy Module Files
    mkdir -p $pkgdir/usr/autodesk/maya2020/modules
    sed -i 's|<BIFROST_DIR>|/usr/autodesk/maya2020/plug-ins/bifrost|g' usr/autodesk/modules/maya/2020/bifrost.mod
    sed -i 's|<PLUGIN_DIR>|/usr/autodesk/maya2020/plug-ins/vnn|g' usr/autodesk/modules/maya/2020/vnn.mod
    cp -a usr/autodesk/modules/maya/2020/*.mod $pkgdir/usr/autodesk/maya2020/modules/

    # Copy Plugin Files
    mkdir -p $pkgdir/usr/autodesk/maya2020/plug-ins
    cp -a usr/autodesk/bifrost/maya2020/$pkgver/bifrost $pkgdir/usr/autodesk/maya2020/plug-ins/
    cp -a usr/autodesk/bifrost/maya2020/$pkgver/vnn $pkgdir/usr/autodesk/maya2020/plug-ins/
}
