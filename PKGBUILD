# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=389-ds-console
pkgver=1.2.12
_majorver=1.2
pkgrel=1
pkgdesc="The Directory Services componenet of the 389 Directory Server console for install from the Admin Server."
arch=('any')
url="http://port389.org"
license=('GPL')
depends=('389-admin')
makedepends=('java-environment')
source=(http://directory.fedoraproject.org/sources/$pkgname-$pkgver.tar.bz2)
sha256sums=('3b8ef3acf4c3369d9345d3b103f0db7265d9bd7874e01af58342ddb3425107a3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ant -Dbuilt.dir=${srcdir}/${pkgname}-${pkgver}/built \
    -Dconsole.location=/usr/share/java 
} 

package(){
  install -d ${pkgdir}/usr/share/dirsrv/html/java
  install -m644 ${srcdir}/${pkgname}-${pkgver}/built/package/389-ds-${pkgver}.jar ${pkgdir}/usr/share/dirsrv/html/java
  install -m644 ${srcdir}/${pkgname}-${pkgver}/built/package/389-ds-${pkgver}_en.jar ${pkgdir}/usr/share/dirsrv/html/java
  ln -s /usr/share/dirsrv/html/java/389-ds-${pkgver}.jar ${pkgdir}/usr/share/dirsrv/html/java/389-ds-${_majorver}.jar
  ln -s /usr/share/dirsrv/html/java/389-ds-${pkgver}_en.jar ${pkgdir}/usr/share/dirsrv/html/java/389-ds-${_majorver}_en.jar
}

# vim:set ts=2 sw=2 et:
