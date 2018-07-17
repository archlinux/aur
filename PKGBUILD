# qt4-fsarchiver by Francois Dupoux, Hihin Ruslan and Dieter Baum
# Contributor: hasufell
# Contributor: DaarkWel
# Maintainer : Marcos Heredia <chelqo@gmail.com>

pkgname=qt5-fsarchiver
pkgver=0.8.4_6
pkgrel=1
pkgdesc='GUI for fsarchiver'
arch=('i686' 'x86_64')
url='http://qt4-fsarchiver.sourceforge.net/'
license=('GPL')
depends=('fsarchiver' 'qt5-base')
optdepends=('gksu' 'kdesu')
makedepends=('qt5-tools')
conflicts=('qt4-fsarchiver')
source=("http://tenet.dl.sourceforge.net/project/qt4-fsarchiver/${pkgname}/source/${pkgname}-${pkgver//_/-}.tar.gz"
        "oper_restore.diff"
        "oper_save.diff")
md5sums=('d76432495dfc45e9f63895f1615a7f34'
         'd57ea7c6e0aceb911eb99d37bab89405'
         '4e0d9187c3a5501bac8990f374b35c3a')

prepare() {
    cd "${srcdir}/${pkgname}"
    sed "s/sbin/bin/" -i qt5-fsarchiver.pro
    sed "s/qt5-fsarchiver\/doc/qt5-fsarchiver-$pkgver/" -i qt5-fsarchiver.pro
    sed "s/app-install\/icons/icons/" -i qt5-fsarchiver.pro
    sed "s/app-install\///" -i starter/*.desktop
    patch -Ri ${startdir}/oper_restore.diff src/oper_restore.c
    patch -Ri ${startdir}/oper_save.diff src/oper_save.c
}

build() {
    cd "${srcdir}/${pkgname}"
    qmake-qt5 qt5-fsarchiver.pro
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make INSTALL_ROOT="${pkgdir}" install
}
