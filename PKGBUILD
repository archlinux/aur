# Maintainer: Simone Cimarelli a.k.a. AquilaIrreale <aquilairreale@ymail.com>
pkgname=schemaspy
pkgver=6.2.3
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
sha256sums=('164059a38b514f4771a8a9560f0dbe669d012a3cfdd00b4456c586799c846c09')

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
