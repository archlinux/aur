# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname="qt5-plugin-sql-oci"
pkgver=5.4.2
pkgrel=1
pkgdesc="QT5 Oracle OCI SQL plugin"
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('custom')
depends=("qt5-base>=${pkgver}" "oracle-instantclient-basic>=12.1.0.2.0")
makedepends=("oracle-instantclient-sdk>=12.1.0.2.0")
groups=('qt' 'qt5')
_pkgfqn="qtbase-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('67a95eec79ffc4a14f516ad6f3d24c96')

build() {
    cd "${srcdir}/${_pkgfqn}/src/plugins/sqldrivers/oci"
    qmake "LIBS+= -lclntsh -lnnz12" oci.pro  
    make
}

package() {  
  install -D "${srcdir}/${_pkgfqn}/plugins/sqldrivers/libqsqloci.so" "${pkgdir}/usr/lib/qt/plugins/sqldrivers/libqsqloci.so"
}

