# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=389-ds-console
pkgver=1.2.16
_majorver=1.2
pkgrel=2
pkgdesc="The Directory Services componenet of the 389 Directory Server console for install from the Admin Server."
arch=('any')
url="http://port389.org"
license=('GPL')
depends=('389-admin')
makedepends=('java-environment')
source=("https://fedorapeople.org/groups/389ds/binaries/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('ee7267b1700d0f42a8f71a6f80fb02bd6c7065578201669a3838f21b514b0f7b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ant -Dbuilt.dir=${srcdir}/${pkgname}-${pkgver}/built \
    -Dconsole.location=/usr/share/java 
} 

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d ${pkgdir}/usr/share/dirsrv/html/java
  install -d ${pkgdir}/usr/share/dirsrv/manual/en/slapd/help
  install -m644 built/package/389-ds-${pkgver}.jar ${pkgdir}/usr/share/dirsrv/html/java
  install -m644 built/package/389-ds-${pkgver}_en.jar ${pkgdir}/usr/share/dirsrv/html/java
  ln -s /usr/share/dirsrv/html/java/389-ds-${pkgver}.jar ${pkgdir}/usr/share/dirsrv/html/java/389-ds-${_majorver}.jar
  ln -s /usr/share/dirsrv/html/java/389-ds-${pkgver}.jar ${pkgdir}/usr/share/dirsrv/html/java/389-ds.jar
  ln -s /usr/share/dirsrv/html/java/389-ds-${pkgver}_en.jar ${pkgdir}/usr/share/dirsrv/html/java/389-ds-${_majorver}_en.jar
  ln -s /usr/share/dirsrv/html/java/389-ds-${pkgver}_en.jar ${pkgdir}/usr/share/dirsrv/html/java/389-ds_en.jar
  install -m664 help/en/tokens.map "${pkgdir}/usr/share/dirsrv/manual/en/slapd"
  install -m664 help/en/*.html "${pkgdir}/usr/share/dirsrv/manual/en/slapd"
  install -m664 help/en/help/*.html "${pkgdir}/usr/share/dirsrv/manual/en/slapd/help"
}

# vim:set ts=2 sw=2 et:
