# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>
pkgname=idm-console-framework
pkgver=1.1.17
pkgrel=3
pkgdesc="A Java Management Console framework used for remote server management."
arch=('x86_64')
url="http://directory.fedoraproject.org"
license=('GPL')
depends=('ldapjdk' 'jss')
makedepends=('apache-ant' 'java-environment')
source=("https://fedorapeople.org/groups/389ds//binaries/$pkgname-$pkgver.tar.bz2")
sha256sums=('3438848f3412aaa444836352d785229c51fa7d6723ce9d63c367ce517722c9b7')

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
