# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Cravix < dr dot neemous at gmail dot com >
# Contributor: Tom < reztho at archlinux dot us >
#
pkgname="pyjama"
pkgver="0.3.1"
pkgrel="1"
pkgdesc="Unofficial Python/GTK Medialibrary for Jamendo"
arch=('any')
url="https://launchpad.net/pyjama"
license=('GPL')
depends=('pygtk' 'python2-simplejson' 'python2-pysqlite' 'gstreamer0.10-python' 'gstreamer0.10-bad-plugins' 'python2-numpy' 'gstreamer0.10-ugly-plugins' 'python2-lxml')
optdepends=('gnome-python-extras' 'python2-notify')
source=("pyjama.tgz::http://bazaar.launchpad.net/~pyjamateam/pyjama/main/tarball/273?start_revid=273")
sha256sums=('6d99d2c4f22174d16054defdb1f0b23eb521e25d1bf9a7a1ef2dc2a54bd56aa5')

_pyjama_bin="#!/bin/bash
python2 /usr/share/apps/pyjama/pyjama.py"

build() {
    cd "${srcdir}"
    echo -e "$_pyjama_bin" | tee pyjama
}

package() {
    cd "${srcdir}/~pyjamateam/${pkgname}/main/release"

    find . -name "*~*" -exec rm {} \;

    install -d ${pkgdir}/usr/share/apps/pyjama

    cp -R ./src/* ${pkgdir}/usr/share/apps/pyjama/

    install -d ${pkgdir}/usr/share/pixmaps
    install -d ${pkgdir}/usr/share/applications
    cp ${pkgdir}/usr/share/apps/pyjama/images/pyjama.xpm ${pkgdir}/usr/share/pixmaps
    cp ${pkgdir}/usr/share/apps/pyjama/pyjama.desktop ${pkgdir}/usr/share/applications

    install -d ${pkgdir}/usr/bin

    cd "${srcdir}"
    install -m 755 pyjama ${pkgdir}/usr/bin/

    # It's compatible only with python 2
    sed -i 's@#!/usr/bin/env python@#!/usr/bin/env python2@' ${pkgdir}/usr/share/apps/pyjama/pyjama.py
}

# vim:set ts=4 sw=2 ft=sh et:
