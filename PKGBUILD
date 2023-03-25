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
pkgver=9.14.0
pkgrel=1
pkgdesc='Provides dependencies desktop file and common fixes for MATLAB.'
arch=('x86_64')
url='http://www.mathworks.com'
license=(custom)
depends=(
    'gst-plugins-base-libs'
    'gtk3'
    'libsndfile'
    'libxcrypt-compat'
    'libxt'
    'lsb-release'
    'make'
    'net-tools'
    'nss'
    'procps'
    'python'
    'sudo'
    'unixodbc'
    'unzip'
    'wget'
)
optdepends=(
    'gcc6: For MEX support'
    'gcc7: For MEX support'
    'gcc8: For MEX support'
    'gcc9: For MEX support'
    'gcc: For MEX support'
    'libselinux: for Addon manager support'
    'python-pip: for setting up Python engine'
    'gconf: may be needed for Live Scripts'
)
makedepends=('gendesk')
provides=('matlab=$pkgver')
conflicts=('matlab')
source=()

prepare() {
    # desktop file overrides some problematic libraries from MATLAB's install
    # see https://wiki.archlinux.org/index.php/Matlab#Addon_manager_not_working for more info

        msg2 'Creating desktop file'
        gendesk -f -n --pkgname 'matlab' \
        --pkgdesc 'A high-level language for numerical computation and visualization.' \
        --categories 'Development;Education;Science;Mathematics;IDE' \
        --exec 'env LD_PRELOAD=/usr/lib/libfreetype.so:/usr/lib/libstdc++.so:/usr/lib/libfontconfig.so matlab -desktop' \
        --mimetypes 'text/x-matlab' \
        "${srcdir}/matlab.desktop" >/dev/null 
}

package() {
    msg2 'Installing desktop files'
    install -D -m644 "matlab.desktop" "${pkgdir}/usr/share/applications/matlab.desktop"
}


