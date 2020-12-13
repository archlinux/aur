# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=maya-substance
pkgver=2.1.7
pkgrel=1
pkgdesc='Autodesk Maya Substance Plugin'
arch=('x86_64')
url='https://www.substance3d.com/ecosystem-plug-ins/substance-in-maya'
license=('custom')
depends=('bzip2' 'double-conversion' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'glu' 'graphite' 'harfbuzz'
         'icu' 'libgcrypt' 'libglvnd' 'libgpg-error' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxdmcp'
         'libxext' 'lz4' 'md4c' 'pcre' 'pcre2' 'qt5-base' 'systemd-libs' 'xz' 'zlib' 'zstd' 'maya=2020.4')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://SubstanceInMaya-$pkgver-2020-Linux.rpm")
sha256sums=('4516239dbbdbbd1cbea9bad8ec674860a1817fc4bee0addc322e5460464823d8')

options=(!strip)

package() {
    # Patch & Install mod File
    echo "+ PLATFORM:linux substance2 $pkgver /usr/autodesk/maya2020/plug-ins/substance2" > opt/Allegorithmic/Substance_in_Maya/2020/substance2.mod
    echo 'PATH+:=lib' >> opt/Allegorithmic/Substance_in_Maya/2020/substance2.mod

    mkdir -p $pkgdir/usr/autodesk/maya2020/modules
    mv opt/Allegorithmic/Substance_in_Maya/2020/substance2.mod $pkgdir/usr/autodesk/maya2020/modules/substance2.mod

    # Copy Plugin Files
    mkdir -p $pkgdir/usr/autodesk/maya2020/plug-ins/substance2
    cp -a opt/Allegorithmic/Substance_in_Maya/2020/* $pkgdir/usr/autodesk/maya2020/plug-ins/substance2/
}
