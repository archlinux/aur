# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname="qt5-plugin-sql-oci"
pkgver=5.6.0
_pkgicver=12.1.0.2.0
pkgrel=1
pkgdesc="QT5 Oracle OCI SQL plugin."
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('custom')
depends=("qt5-base>=${pkgver}" "oracle-instantclient-basic>=${_pkgicver}")
makedepends=("oracle-instantclient-sdk>=${_pkgicver}")
groups=('qt' 'qt5')
_pkgfqn="qtbase-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('d6b6cfd333c22829c6c85fc52ceed019')

build() {
    cd "${srcdir}/${_pkgfqn}/src/plugins/sqldrivers/oci"
    qmake "LIBS+= -lclntsh -lnnz12" oci.pro  
    make
}

package() {  
  install -D "${srcdir}/${_pkgfqn}/plugins/sqldrivers/libqsqloci.so" "${pkgdir}/usr/lib/qt/plugins/sqldrivers/libqsqloci.so"
}

