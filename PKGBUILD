# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=maya-arnold
pkgver=4.1.1
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://www.arnoldrenderer.com/arnold/arnold-for-maya/'
license=('custom')
depends=('attr' 'bzip2' 'double-conversion' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'graphite'
         'harfbuzz' 'icu' 'libgcrypt' 'libglvnd' 'libgpg-error' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'lz4' 'md4c'
         'pcre' 'pcre2' 'qt5-base' 'qt5-x11extras' 'systemd-libs' 'tbb' 'util-linux-libs' 'xz' 'zlib' 'zstd' 'maya=2020.4')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=('manual://package.zip')
sha256sums=('6444aadce342c9808393c7c6a6397e191b17038e5606ce646e9ad7f0d9c39bbe')

options=(!strip)

package() {
    # Install mod File to Maya Directory
    sed -i 's|/jenkins/workspace/Arnold-MTOA_Build_LINUX_CENTOS73/MTOA_DEPLOY|/usr/autodesk/maya2020/plug-ins/arnold|g' mtoa.mod
    install -D -m 644 mtoa.mod $pkgdir/usr/autodesk/maya2020/modules/mtoa.mod

    # Copy Everything else
    rm mtoa.mod readme.txt
    unlink package.zip
    mkdir -p $pkgdir/usr/autodesk/maya2020/plug-ins/arnold
    cp -a * $pkgdir/usr/autodesk/maya2020/plug-ins/arnold
}
