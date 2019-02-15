# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=389-admin-console
pkgver=1.1.12
_majorver=1.1
pkgrel=2
pkgdesc="The Admin Server componenet of the 389 Directory Server console for install from the Admin Server.."
arch=('any')
url="http://port389.org"
license=('GPL')
depends=('389-console')
makedepends=('apache-ant')
source=("http://directory.fedoraproject.org/sources/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('9eea595bc74b0f704a2f9621258c7d96f6850fddf764af7c221f7a65f5335237')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ant -Dbuilt.dir=${srcdir}/${pkgname}-${pkgver}/built \
    -Dconsole.location=/usr/share/java 
} 

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d ${pkgdir}/usr/share/dirsrv/html/java
  install -d ${pkgdir}/usr/share/dirsrv/manual/en/admin/help
  install -m644 built/package/389-admin-${pkgver}.jar ${pkgdir}/usr/share/dirsrv/html/java
  install -m644 built/package/389-admin-${pkgver}_en.jar ${pkgdir}/usr/share/dirsrv/html/java
  ln -s /usr/share/dirsrv/html/java/389-admin-${pkgver}.jar ${pkgdir}/usr/share/dirsrv/html/java/389-admin-${_majorver}.jar
  ln -s /usr/share/dirsrv/html/java/389-admin-${pkgver}.jar ${pkgdir}/usr/share/dirsrv/html/java/389-admin.jar
  ln -s /usr/share/dirsrv/html/java/389-admin-${pkgver}_en.jar ${pkgdir}/usr/share/dirsrv/html/java/389-admin-${_majorver}_en.jar
  ln -s /usr/share/dirsrv/html/java/389-admin-${pkgver}_en.jar ${pkgdir}/usr/share/dirsrv/html/java/389-admin_en.jar
  install -m664 help/en/tokens.map "${pkgdir}/usr/share/dirsrv/manual/en/admin/"
  install -m664 help/en/*.html "${pkgdir}/usr/share/dirsrv/manual/en/admin/"
  install -m664 help/en/help/*.html "${pkgdir}/usr/share/dirsrv/manual/en/admin/help"
}

# vim:set ts=2 sw=2 et:
