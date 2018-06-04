# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daniel J Griffiths <griffithsdj@archlinux.us>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Marc poiroud <marci1 AT archlinux.fr>

pkgname=qt-recordmydesktop
pkgver=0.3.8
pkgrel=7
pkgdesc="Qt4 frontend for recordMyDesktop"
arch=('x86_64')
url="http://recordmydesktop.sourceforge.net"
license=('GPL')
depends=('recordmydesktop>=0.3.8.1' 'python2-pyqt' 'xorg-xwininfo')
source=(http://downloads.sourceforge.net/sourceforge/recordmydesktop/${pkgname}-${pkgver}.tar.gz
        'pyqt4.patch')
md5sums=('bf1525740755615ae172ae27fef68fb5'
         'ce1dc05b512df883d0e204eac2b1eaaf')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}"/pyqt4.patch
}

build() {
  cd ${pkgname}-${pkgver}

  # python2 fix
  sed -i 's|PYQT4_VERSION=`python -c|PYQT4_VERSION=`python2 -c|' configure
  sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' src/qt-recordMyDesktop.in

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}
