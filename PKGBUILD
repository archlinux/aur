# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Cravix < dr dot neemous at gmail dot com >
# Contributor: Tom < reztho at archlinux dot us >
#
pkgname="pyjama"
pkgver="0.3.0.78"
pkgrel="2"
pkgdesc="Unofficial Python/GTK Medialibrary for Jamendo"
arch=('any')
url="https://launchpad.net/pyjama"
license=('GPL')
depends=('pygtk' 'python2-simplejson' 'python2-pysqlite' 'gstreamer0.10-python' 'gstreamer0.10-bad-plugins' 'python2-numpy' 'gstreamer0.10-ugly-plugins' 'python2-lxml')
optdepends=('gnome-python-extras' 'python2-notify')
source=("http://xn--ngel-5qa.de/pyjama/release/pyjama-${pkgver}_all.tar.gz")
sha256sums=('1a96e9ca85fa7fa91a41da535f807cfe66e183d909a22fefe02fd737e6919886')

package() 
{
    cd "${srcdir}/${pkgname}-${pkgver}_all"

    find . -name "*~*" -exec rm {} \;

    mkdir -p ${pkgdir}/usr/share/apps/pyjama

    cp -R ${srcdir}/${pkgname}-${pkgver}_all/src/* ${pkgdir}/usr/share/apps/pyjama/

    mkdir -p ${pkgdir}/usr/share/pixmaps
    mkdir -p ${pkgdir}/usr/share/applications
    cp ${pkgdir}/usr/share/apps/pyjama/images/pyjama.xpm ${pkgdir}/usr/share/pixmaps
    cp ${pkgdir}/usr/share/apps/pyjama/pyjama.desktop ${pkgdir}/usr/share/applications

    mkdir -p ${pkgdir}/usr/bin/
    echo '#!/bin/bash
python2 /usr/share/apps/pyjama/pyjama.py' > ${pkgdir}/usr/bin/pyjama
    chmod 755 ${pkgdir}/usr/bin/pyjama

    # It's compatible only with python 2
    sed -i 's@#!/usr/bin/env python@#!/usr/bin/env python2@' ${pkgdir}/usr/share/apps/pyjama/pyjama.py
}

# vim:set ts=4 sw=2 ft=sh et:
