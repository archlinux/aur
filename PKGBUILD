# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=h2
pkgver=1.4.191
_releasever=2016-01-21
pkgrel=1
pkgdesc="Java SQL database engine."
arch=(any)
url="http://www.h2database.com"
license=(MPL EPL)
depends=('java-runtime>=6' 'bash')
source=("http://www.h2database.com/h2-${_releasever}.zip")
md5sums=('bb27685d47e918a18614b9202ec297d4')

build() {
  msg2 "Generate executable script..."
  cat > "${srcdir}/${pkgname}-console.sh" << EOF
#!/bin/sh
"\$JAVA_HOME/bin/java" -cp "/usr/share/java/${pkgname}/${pkgname}.jar:\$H2DRIVERS:\$CLASSPATH" org.h2.tools.Console "\$@"
EOF
}

package() {
  msg2 "Install Java livraries in /usr/share/java/${pkgname}..."
  install -Dm755 "${srcdir}/${pkgname}/bin/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

  msg2 "Install an executable at /usr/bin/${pkgname}..."
  install -Dm755 "${srcdir}/${pkgname}-console.sh" "${pkgdir}/usr/bin/${pkgname}-console"

  msg2 "Install documentation resources in /usr/share/doc/${pkgname}..."
  install -dm755                      "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a "${srcdir}"/${pkgname}/docs/* "${pkgdir}/usr/share/doc/${pkgname}"
}
