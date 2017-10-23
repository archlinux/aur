# qt4-fsarchiver by Francois Dupoux, Hihin Ruslan and Dieter Baum
# Contributor: hasufell
# Contributor: DaarkWel
# Maintainer : Marcos Heredia <chelqo@gmail.com>

pkgname=qt5-fsarchiver
pkgver=0.8.1_1
pkgrel=2
pkgdesc='GUI for fsarchiver'
arch=('i686' 'x86_64')
url='http://qt4-fsarchiver.sourceforge.net/'
license=('GPL')
depends=('fsarchiver' 'qt5-base')
optdepends=('gksu' 'kdesu')
makedepends=('qt5-tools')
conflicts=('qt4-fsarchiver')
source=("http://tenet.dl.sourceforge.net/project/qt4-fsarchiver/${pkgname}/source/${pkgname}-${pkgver//_/-}.tar.gz")
md5sums=('f754c56287b03b876cb7fda5ddce37d6')

build() {
    cd "${srcdir}/${pkgname}"
    sed "s/sbin/bin/" -i qt5-fsarchiver.pro
    sed "s/qt5-fsarchiver\/doc/qt5-fsarchiver-$pkgver/" -i qt5-fsarchiver.pro
    sed "s/app-install\/icons/icons/" -i qt5-fsarchiver.pro
    sed "s/app-install\///" -i starter/*.desktop
    qmake-qt5 qt5-fsarchiver.pro
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make INSTALL_ROOT="${pkgdir}" install
    install -Dpm755 ${srcdir}/${pkgname}/src/sbin/qt5-fsarchiver_polkit ${pkgdir}/usr/bin/
}
