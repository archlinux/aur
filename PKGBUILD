# Maintainer ~ kyle[dot]devir[at]mykolab[dot]com
# Co-Maintainer: William Tang <ttan0037@student.monash.edu>
# Co-Maintainer: Ilya Chelyadin  <ilya77105@gmail.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=maya
pkgver=2020.4
pkgrel=1
pkgdesc='Autodesk Maya 3D Animation, Modelling, Simulation and Rendering Software'
arch=('x86_64')
url='http://www.autodesk.com/products/maya/overview'
license=('custom')
depends=('alsa-lib' 'atk' 'attr' 'audiofile' 'avahi' 'bzip2' 'cairo' 'curl' 'dbus' 'double-conversion'
         'e2fsprogs' 'expat' 'flac' 'fontconfig' 'freetype2' 'fribidi' 'gcc-libs' 'gdk-pixbuf2' 'glib2'
         'glibc' 'glu' 'gmp' 'gnutls' 'graphite' 'gst-plugins-base-libs' 'gstreamer' 'gtk2' 'harfbuzz'
         'icu' 'keyutils' 'krb5' 'lib32-glibc' 'libasyncns' 'libcups' 'libdatrie' 'libdrm' 'libelf'
         'libffi' 'libgcrypt' 'libglvnd' 'libgpg-error' 'libice' 'libidn2' 'libjpeg6-turbo' 'libjpeg-turbo'
         'libnghttp2' 'libogg' 'libp11-kit' 'libpng' 'libpng15' 'libpsl' 'libpulse' 'librsvg' 'libsm'
         'libsndfile' 'libssh2' 'libtasn1' 'libthai' 'libtiff' 'libtool' 'libunistring' 'libunwind'
         'libvorbis' 'libx11' 'libxau' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxdmcp'
         'libxext' 'libxfixes' 'libxft' 'libxi' 'libxinerama' 'libxkbcommon' 'libxkbcommon-x11' 'libxml2'
         'libxmu' 'libxp' 'libxpm' 'libxrandr' 'libxrender' 'libxslt' 'libxss' 'libxt' 'libxtst' 'libxv'
         'lz4' 'md4c' 'ncurses5-compat-libs' 'nettle' 'nspr' 'nss' 'openssl' 'opensubdiv' 'orc' 'pango'
         'pciutils' 'pcre' 'pcre2' 'pixman' 'python2' 'qt5-base' 'qt5-declarative' 'qt5-location' 'qt5-svg'
         'qt5-webchannel' 'qt5-x11extras' 'sqlite' 'systemd-libs' 'tbb' 'util-linux-libs' 'xorg-fonts-75dpi'
         'xorg-fonts-100dpi' 'xz' 'zlib' 'zstd' 'adlmapps>=17' 'adsklicensing=9.2.1.2399')
optdepends=('adlmflexnetclient: Autodesk Stand-alone Licensing Software'
            'adlmflexnetserver-ipv6: Autodesk Network Licensing Software (Deprcate on August 7, 2021)'
            'maya-arnold: Maya Arnold Renderer Plugin'
            'maya-bifrost: Maya Bifrost Effects Plugin'
            'maya-rokoko-motion-library: Maya Rokoko Motion Library Animation Plugin'
            'maya-substance: Maya Substance Material Plugin')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=('manual://Maya2020_64-2020.4-1627.x86_64.rpm'
        'maya.desktop')
sha256sums=('96f8267fd9ebe458f58d399f0e49bf98e715e16aaf32c27a88d496ce406ca483'
            '4a9d30816a2540e8feafa54d124e0372c5e37d5be468ce3b85977ac5e97e5a12')

options=(!strip)

package() {
    mv $srcdir/opt $srcdir/usr $srcdir/var $pkgdir/

    # Fix Symbol Links
    mkdir -p $pkgdir/usr/lib
    ln -sf /usr/lib/libssl.so.1.1 $pkgdir/usr/lib/libssl.so.10
    ln -sf /usr/lib/libcrypto.so.1.1 $pkgdir/usr/lib/libcrypto.so.10
    ln -sf /usr/autodesk/maya2020/lib/libtbb_preview.so.2 $pkgdir/usr/lib/libtbb_preview.so.2

    # Fix tmp Directory
    ln -sf /tmp $pkgdir/usr/tmp

    # Install desktop File
    install -D -m 644 maya.desktop $pkgdir/usr/share/applications/maya.desktop
}
