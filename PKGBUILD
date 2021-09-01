# Maintainer: Jesse R Codling <jclds139@gmail.com>
# Contributor: Ariel Lieberman <rellieberman at gmail dot com>
# Contributer: Michael R. Shannon <mrshannon.aerospace@gmail.com>

## This PKGBUILD installs dependencies, provides desktop icons, and patches a
## currently installed version MATLAB.  It should be installed after a manual
## install of MATLAB and will find the location where MATLAB is installed
## assuming the executable is on the PATH.  This package should not be used with
## the AUR matlab package by Daniel Shub and Ido Rosen.

## The version of this package will always match the MATLAB ## version numbers
## (of which you can find here
## https://en.wikipedia.org/wiki/MATLAB#Release_history) for which this package
## is intended to support.  Please flag as out of date upon a new MATLAB
## release.

## MATLAB is a commercial product with a paid license, this package does not
## provide MATLAB, it only provides dependencies and fixes to make it run better
## on Arch Linux.

## Much thanks to Daniel Shub and Ido Rosen whose matlab PKGBUILD served as a
## guide when making this one.

pkgname=matlab-support
pkgver=9.9.0
pkgrel=1
pkgdesc='Provides dependencies desktop file and common fixes for MATLAB.'
arch=('x86_64')
url='http://www.mathworks.com'
license=(custom)
depends=(
    'ca-certificates'
    'lsb-release'
    'alsa-lib'
    'atk'
    'libcap'
    'libcups'
    'libdbus'
    'fontconfig'
    'libgcrypt'
    'gdk-pixbuf2'
    'gst-plugins-base'
    'gstreamer'
    'gtk2'
    'krb5'
    'nspr'
    'nss'
    'pam'
    'pango'
    'cairo'
    'libsm'
    'libsndfile'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxcursor'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxft'
    'libxi'
    'libxmu'
    'libxrandr'
    'libxrender'
    'libxslt'
    'libxss'
    'libxt'
    'libxtst'
    'libxxf86vm'
    'procps-ng'
    'xorg-server-xvfb'
    'x11vnc'
    'sudo'
    'zlib'
    'portaudio'
    'glu'
    'libunwind'
    'libxp'
    'libxpm'
    'portaudio'
    'qt5-svg'
    'qt5-webkit'
    'qt5-websockets'
    'qt5-x11extras'
    'xerces-c')

    optdepends=('gcc6: For MEX support'
        'gcc7: For MEX support'
        'gcc8: For MEX support'
        'gcc9: For MEX support'
        'gcc: For MEX support'
        'libselinux: for Addon manager support'
        'gconf: may be needed for Live Scripts')
        makedepends=('gendesk')
        provides=('matlab')
        conflicts=('matlab')
        source=('https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png')
sha512sums=('ba72458379c89b22a27d1d7e357cefae4437fa28caac47b26ccd4f5b01b8cbc2c000baf38b5a52565f29b14e6da922bc3dc14bc5d47fa682fb6871422a59c397')

        prepare() {
            # desktop file links matlab to system glib's as opposed to the ones shipped with matlab
            # see https://wiki.archlinux.org/index.php/Matlab#Addon_manager_not_working for more info

            msg2 'Creating desktop file'
            gendesk -f -n --pkgname 'matlab' \
                --pkgdesc 'A high-level language for numerical computation and visualization.' \
                --categories 'Development;Education;science;Mathematics;IDE' \
                --exec 'env env LD_PRELOAD=/usr/lib/libfreetype.so.6:/usr/lib/libstdc++.so.6:/usr/lib/libgio-2.0.so:/usr/lib/libglib-2.0.so:/usr/lib/libgmodule-2.0.so:/usr/lib/libgobject-2.0.so:/usr/lib/libgthread-2.0.so matlab -desktop' \
                --mimetypes 'text/x-matlab' \
                "${srcdir}/matlab.desktop" >/dev/null 
            }

        package() {
            msg2 'Installing desktop files'
            install -D -m644 "matlab.desktop" "${pkgdir}/usr/share/applications/matlab.desktop"
            install -D -m644 "Matlab_Logo.png" "${pkgdir}/usr/share/pixmaps/matlab.png"
        }
