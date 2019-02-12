# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>

pkgname=idm-console-framework
pkgver=1.2.0
pkgrel=1
pkgdesc="A Java Management Console framework used for remote server management."
arch=('x86_64')
url="http://directory.fedoraproject.org"
license=('GPL')
depends=('ldapjdk')
makedepends=('apache-ant' 'java-environment')
source=("https://github.com/dogtagpki/idm-console-framework/archive/v${pkgver}.tar.gz")
sha256sums=('b8b43bd48ffaba6acc1e11db821afdeb62f5a42b7ab3667c16ad2a899846a8a6')

major_version=1.1

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  /usr/bin/ant -Dlib.dir=/usr/lib \
    -Dbuilt.dir=`pwd`/built \
    -Dclassdest=/usr/share/java \
    -Djss.local.location=/usr/lib/jss
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d $pkgdir/usr/share/java
  install -m644 built/release/jars/idm-console-* $pkgdir/usr/share/java/

  cd ${pkgdir}/usr/share/java
  ln -s idm-console-base-${pkgver}.jar idm-console-base-${major_version}.jar
  ln -s idm-console-mcc-${pkgver}.jar idm-console-mcc-${major_version}.jar
  ln -s idm-console-mcc-${pkgver}_en.jar idm-console-mcc-${major_version}_en.jar
  ln -s idm-console-nmclf-${pkgver}.jar idm-console-nmclf-${major_version}.jar
  ln -s idm-console-nmclf-${pkgver}_en.jar idm-console-nmclf-${major_version}_en.jar
}

# vim:set ts=2 sw=2 et:
