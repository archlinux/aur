pkgname=soot-with-dependencies
pkgver=4.3.0
pkgrel=1
pkgdesc="A Java Bytecode Analysis and Transformation Framework."
arch=(any)
url="http://www.sable.mcgill.ca/soot"
license=(LGPL)
depends=(java-runtime bash)
source=("${pkgname}-${pkgver}.jar::https://repo1.maven.org/maven2/org/soot-oss/soot/${pkgver}/soot-${pkgver}-jar-with-dependencies.jar")
md5sums=('f116a9fa038aa4213b5700456cc31ba9')

build() {
  msg2 "Generate executable script..."
  cat > "${srcdir}/${pkgname}.sh" << EOF
#!/bin/sh
cd '/usr/share/java/${pkgname}'
"\$JAVA_HOME/bin/java" -jar '/usr/share/java/${pkgname}/${pkgname}.jar' "\$@"
EOF
}

package() {
  msg2 "Install the library at /usr/share/java/${pkgname}..."
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

  msg2 "Install an executable at /usr/bin/${pkgname}..."
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/soot"
}
