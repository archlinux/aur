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
pkgver=9.11.0
pkgrel=3
pkgdesc='Provides dependencies desktop file and common fixes for MATLAB.'
arch=('x86_64')
url='http://www.mathworks.com'
license=(custom)
depends=(
    'ca-certificates'
    'alsa-lib'
    'at-spi2-atk'
    'atk'
    'at-spi2-core'
    'glibc'
    'libxcrypt-compat'
    'cairo'
    'libcap'
    'libcups'
    'dbus'
    'libdrm'
    'fontconfig'
    'mesa'
    'gdk-pixbuf2'
    'glib2'
    'gcc-libs'
    'gstreamer'
    'gst-plugins-base-libs'
    'gtk3'
    'nspr'
    'nss'
    'unixodbc'
    'pam'
    'pango'
    'python'
    'libsm'
    'libsndfile'
    'openssl'
    'util-linux-libs'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxcursor'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxft'
    'libxi'
    'libxinerama'
    'libxrandr'
    'libxrender'
    'libxt'
    'libxtst'
    'libxxf86vm'
    'net-tools'
    'procps'
    'sudo'
    'unzip'
    'wget'
    'zlib'
    'lsb-release'
    'dconf'
    )

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

        prepare() {
            # desktop file links matlab to system glib's as opposed to the ones shipped with matlab
            # see https://wiki.archlinux.org/index.php/Matlab#Addon_manager_not_working for more info

            msg2 'Creating desktop file'
            gendesk -f -n --pkgname 'matlab' \
                --pkgdesc 'A high-level language for numerical computation and visualization.' \
                --categories 'Development;Education;Science;Mathematics;IDE' \
                --exec 'env env LD_PRELOAD=/usr/lib/libfreetype.so.6:/usr/lib/libstdc++.so.6:/usr/lib/libgio-2.0.so:/usr/lib/libglib-2.0.so:/usr/lib/libgmodule-2.0.so:/usr/lib/libgobject-2.0.so:/usr/lib/libgthread-2.0.so matlab -desktop' \
                --mimetypes 'text/x-matlab' \
                "${srcdir}/matlab.desktop" >/dev/null 
            }

        package() {
            msg2 'Installing desktop files'
            install -D -m644 "matlab.desktop" "${pkgdir}/usr/share/applications/matlab.desktop"
        }

