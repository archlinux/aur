# Maintainer : Thomas Weißschuh <thomas t-8ch.de>

pkgname=hsqldb2-java
pkgver=2.3.2
pkgrel=1
pkgdesc="HSQLDB Java libraries, Version 2"
arch=('any')
license=('custom')
depends=('java-environment')
makedepends=('unzip' 'apache-ant')
conflicts=('hsqldb-java')
source=("http://downloads.sourceforge.net/project/hsqldb/hsqldb/hsqldb_2_3/hsqldb-${pkgver}.zip")
url="http://hsqldb.org/"


build() {
  [ -z "${JAVA_HOME}" ] && . /etc/profile.d/jre.sh
  [ -z "${ANT_HOME}" ] && . /etc/profile.d/apache-ant.sh

  cd "${srcdir}/hsqldb-${pkgver}/hsqldb/build"

  mkdir -p ../doc-src/
  ant hsqldb

}

package() {

  mkdir -p "${pkgdir}/usr/share/java"
  install -m644 \
          "${srcdir}/hsqldb-${pkgver}/hsqldb/lib/"{hsqldb,sqltool}.jar \
          "${pkgdir}/usr/share/java/"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 \
          "${srcdir}/hsqldb-${pkgver}/hsqldb/doc/hsqldb_lic.txt" \
          "${pkgdir}/usr/share/licenses/${pkgname}/"
}
sha256sums=('573082ab3f1c8f02c1f496b9aae15b74f1b5aedf3812ef300e90ead3047e5fb0')
