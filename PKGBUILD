# Maintainer : Thomas Weißschuh <aur t-8ch.de>

pkgname=hsqldb2-java
pkgver=2.4.0
pkgrel=1
pkgdesc="HSQLDB Java libraries, Version 2"
arch=('any')
license=('custom')
depends=('java-environment')
makedepends=('unzip' 'apache-ant')
conflicts=('hsqldb-java')
source=("https://downloads.sourceforge.net/project/hsqldb/hsqldb/hsqldb_2_4/hsqldb-${pkgver}.zip")
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
sha256sums=('1c99d43fbdd87b22fb8a788d70af4042eeb8da9314886103b38ce71cffb13f2d')
