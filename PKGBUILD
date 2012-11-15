# Maintainer : Thomas Weißschuh <thomas_weissschuh||lavabit.com>

pkgname=hsqldb2-java
pkgver=2.2.9
pkgrel=1
pkgdesc="HSQLDB Java libraries, Version 2"
arch=('any')
license=('custom')
depends=('java-environment')
makedepends=('java-runtime' 'unzip' 'apache-ant')
conflicts=('hsqldb-java')
source=("http://downloads.sourceforge.net/project/hsqldb/hsqldb/hsqldb_2_2/hsqldb-${pkgver}.zip")
url="http://hsqldb.org/"


build() {
  [ -z "${JAVA_HOME}" ] && . /etc/profile.d/openjdk6.sh
  [ -z "${ANT_HOME}" ] && . /etc/profile.d/apache-ant.sh

  cd ${srcdir}/hsqldb-${pkgver}/hsqldb/build

  mkdir -p ../doc-src/
  ant hsqldb

}

package() {

  mkdir -p ${pkgdir}/usr/share/java
  install -m644 ${srcdir}/hsqldb-${pkgver}/hsqldb/lib/hsqldb.jar ${pkgdir}/usr/share/java/

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 ${srcdir}/hsqldb-${pkgver}/hsqldb/doc/hsqldb_lic.txt ${pkgdir}/usr/share/licenses/${pkgname}/
}
sha256sums=('6b60decdb59513f52b915abed2223e287ba19360fa77fc8141c4fc6af90c5e72')
