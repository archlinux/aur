# Maintainer: Sandro Kalbermatter <info.kalsan [ät-symbol] valaiscom.ch>
pkgname=schemaspy
pkgver=6.1.0
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
sha256sums=('873e4c76907cd6075ca45eb3bccf50c80e8ffe7b0350b1dc29287578c232ff51')

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
