# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Black_Codec <orso.f.regna@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt4-private-headers-dev
pkgver=4.8.7
pkgrel=3
pkgdesc="Qt4 private headers for development"
arch=('any')
license=('GPL3' 'LGPL' 'FDL' 'custom')
url='https://www.qt.io'
depends=("qt4=${pkgver}")
conflicts=('qt-private-headers' 'qt4-private-headers')
replaces=('qt-private-headers')
provides=('qt4-private-headers')
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("https://ftp.desolve.ru/ftp/viktor/qt4/qt-everywhere-opensource-src-4.8.7.tar.gz")
sha256sums=('e2882295097e47fe089f8ac741a95fef47e0a73a3f3cdf21b56990638f626ea0')

package() {
    install -d "${pkgdir}"/usr/include/qt4/{QtCore,QtDeclarative,QtGui,QtScript}
    install -d "${pkgdir}"/usr/src/qt4/{corelib,declarative,gui,script}
    
    for i in QtCore QtDeclarative QtGui QtScript; do
      cp -r ${_pkgfqn}/include/${i}/private/ \
        "${pkgdir}"/usr/include/qt4/${i}/
    done

    find "${pkgdir}"/usr/include/qt4/ -name *.h \
      -exec sed -i 's|#include "../../../src/|#include "../../../src/qt4/|' {} \;

    for i in corelib declarative gui script; do
      cp -r ${_pkgfqn}/src/${i} "${pkgdir}"/usr/src/qt4/
    done
}
