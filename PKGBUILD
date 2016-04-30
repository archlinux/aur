# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=soot
pkgver=2.5.0
pkgrel=1
pkgdesc="A Java Bytecode Analysis and Transformation Framework."
arch=(any)
url="http://www.sable.mcgill.ca/soot"
license=(LGPL)
depends=(java-runtime bash)
changelog=Changelog
source=("http://www.sable.mcgill.ca/software/${pkgname}-${pkgver}.jar")
noextract=(${pkgname}-${pkgver}.jar)
md5sums=('4fc1880f4bf183dfced1bf3a6e9479ae')

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
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
