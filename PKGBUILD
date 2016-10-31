# Maintainer: Sandro Kalbermatter <info.kalsan [ät-symbol] valaiscom.ch>
pkgname=schemaspy
pkgver=5.0.0
pkgrel=2
pkgdesc="Graphical Database Schema Metadata Browser"
arch=(any)
url="http://schemaspy.sourceforge.net/"
license=(LGPL2.1)
depends=('java-environment' 'bash')
provides=('schemaspy')
install=${pkgname}.install
_jarname="schemaSpy_${pkgver}.jar"
source=("$_jarname::http://downloads.sourceforge.net/project/schemaspy/schemaspy/SchemaSpy%20${pkgver}/schemaSpy_${pkgver}.jar")
noextract=("${_jarname}")
md5sums=('d1a4ca73e932f8c22d6da0f563f42690')

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
