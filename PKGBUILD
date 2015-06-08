# $Id: PKGBUILD 110172 2014-04-25 19:26:00Z jelle $
# Maintainer: Black_Codec <orso.f.regna@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt4-private-headers-dev
#pkgname=qt4-private-headers
pkgver=4.8.7
pkgrel=1
pkgdesc="Qt4 private headers for development"
arch=('any')
license=('GPL3' 'LGPL')
url="http://qt-project.org/"
depends=("qt4=${pkgver}")
conflicts=('qt-private-headers' 'qt4-private-headers')
replaces=('qt-private-headers')
provides=('qt4-private-headers')
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/${pkgver%.*}/${pkgver}/${_pkgfqn}.tar.gz")
md5sums=('d990ee66bf7ab0c785589776f35ba6ad')

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
