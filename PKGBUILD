# Maintainer: Simone Cimarelli a.k.a. AquilaIrreale <aquilairreale@ymail.com>
pkgname=schemaspy
pkgver=6.2.4
pkgrel=1
pkgdesc="Graphical Database Schema Metadata Browser"
arch=(any)
url="http://schemaspy.sourceforge.net/"
license=(LGPL3)
depends=('java-environment' 'bash' 'graphviz')
provides=('schemaspy')
install=${pkgname}.install
_jarname="schemaspy-${pkgver}.jar"
source=("$_jarname::https://github.com/schemaspy/schemaspy/releases/download/v${pkgver}/${_jarname}")
noextract=("${_jarname}")
sha256sums=('50abf42c6fbf746b36365f81adb9686e1da83344e89f2719a31e6c1209ebcaad')

build() {
  msg2 "Generate start script..."
  echo "#!/bin/bash" > "${srcdir}"/${pkgname}
  echo "java -jar /opt/${pkgname}/${_jarname}" '$@' >> "${srcdir}"/${pkgname}
}

package() {
  msg2 "Installing the assembly at /opt/${pkgname}..."
  install -dm755          "${pkgdir}"/opt/${pkgname}
  cp "${srcdir}"/${_jarname} "${pkgdir}"/opt/${pkgname}

  msg2 "Installing the start script in /usr/bin..."
  install -dm755 "${pkgdir}"/usr/bin/  
  install -m755 "${srcdir}"/${pkgname} "${pkgdir}"/usr/bin/${pkgname}   
}
