# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=389-admin-console
pkgver=1.1.10
_majorver=1.1
pkgrel=1
pkgdesc="The Admin Server componenet of the 389 Directory Server console for install from the Admin Server.."
arch=('any')
url="http://port389.org"
license=('GPL')
depends=('389-admin')
makedepends=('java-environment')
source=(http://directory.fedoraproject.org/sources/$pkgname-$pkgver.tar.bz2)
sha256sums=('b9d78d00f35f1d7072fe1060df77730d2ea09d5ebeb09e441b368dc33601e893')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ant -Dbuilt.dir=${srcdir}/${pkgname}-${pkgver}/built \
    -Dconsole.location=/usr/share/java 
} 

package(){
  install -d ${pkgdir}/usr/share/dirsrv/html/java
  install -m644 ${srcdir}/${pkgname}-${pkgver}/built/package/389-admin-${pkgver}.jar ${pkgdir}/usr/share/dirsrv/html/java
  install -m644 ${srcdir}/${pkgname}-${pkgver}/built/package/389-admin-${pkgver}_en.jar ${pkgdir}/usr/share/dirsrv/html/java
  ln -s /usr/share/dirsrv/html/java/389-admin-${pkgver}.jar ${pkgdir}/usr/share/dirsrv/html/java/389-admin-${_majorver}.jar
  ln -s /usr/share/dirsrv/html/java/389-admin-${pkgver}_en.jar ${pkgdir}/usr/share/dirsrv/html/java/389-admin-${_majorver}_en.jar
}

# vim:set ts=2 sw=2 et:
