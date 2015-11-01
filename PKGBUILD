# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=h2
pkgver=1.4.190
_releasever=2015-10-11
pkgrel=1
pkgdesc="Java SQL database engine."
arch=(any)
url="http://www.h2database.com"
license=(MPL EPL)
depends=('java-runtime>=6' 'bash')
source=("http://www.h2database.com/h2-${_releasever}.zip")
md5sums=('fa103a4ef6db6a4523054c9fed5cec2c')

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
