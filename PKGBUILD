# Maintainer: Simone Cimarelli a.k.a. AquilaIrreale <aquilairreale@ymail.com>
pkgname=schemaspy
pkgver=7.0.2
pkgrel=1
pkgdesc="Graphical Database Schema Metadata Browser"
arch=(any)
url="http://schemaspy.sourceforge.net/"
license=(LGPL-3.0-only)
depends=('java-environment' 'bash' 'graphviz')
provides=('schemaspy')
install="${pkgname}.install"
_jarname="${pkgname}-app.jar"
source=("$_jarname::https://github.com/schemaspy/schemaspy/releases/download/v${pkgver}/${_jarname}")
noextract=("${_jarname}")
sha512sums=('f8a256ed73928ab5a23ac26ea722e881e530af098f5014998b4bbd17c20980d996e39137153504f581346abd07c3556c850bb1efa55c908e319059b1e23878e5')

build() {
  msg2 "Generating start script..."
  echo "#!/bin/bash" > "${srcdir}/${pkgname}"
  echo "java -jar /opt/${pkgname}/${_jarname}" '$@' >> "${srcdir}/${pkgname}"
}

package() {
  msg2 "Installing the assembly at /opt/${pkgname}..."
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp "${srcdir}/${_jarname}" "${pkgdir}/opt/${pkgname}"

  msg2 "Installing the start script in /usr/bin..."
  install -dm755 "${pkgdir}"/usr/bin/
  install -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
