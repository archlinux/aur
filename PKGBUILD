# Maintainer: Sandro Kalbermatter <info.kalsan [ät-symbol] valaiscom.ch>
pkgname=schemaspygui
pkgver=0.99
pkgrel=3
pkgdesc="Graphical user interface for the tool SchemaSpy from John Currier"
arch=(any)
url="http://schemaspy.sourceforge.net/"
license=(LGPL)
depends=('java-environment' 'schemaspy' 'graphviz')
provides=('schemaspygui')
install=${pkgname}.install
source=("schemaSpyGUI20090302.zip::http://downloads.sourceforge.net/project/schemaspygui/schemaspygui/SchemaSpyGUI%20Version%20$pkgver%20%2820090302%29%20-%20Linux%20bugfix/schemaSpyGUI20090302.zip")
md5sums=('997be6c1c5d7ce83dcce6a94380deeee')

build() {
  msg2 "Generate desktop application entry..."
  cat > "${srcdir}"/${pkgname}.desktop << EOF
[Desktop Entry]
Version=${pkgver}
Encoding=UTF-8
Name=SchemaSpyGUI
Comment=${pkgdesc}
Exec=/usr/bin/${pkgname}
Terminal=false
Type=Application
Categories=Development;
EOF

  msg2 "Generate start script..."
  echo "#!/bin/bash" > "${srcdir}"/${pkgname}
  echo "java -jar /opt/${pkgname}/schemaSpyGUI.jar" '$@' >> "${srcdir}"/${pkgname}
}

package() {
  msg2 "Installing the assembly at /opt/${pkgname}..."
  install -dm755          "${pkgdir}"/opt/${pkgname}
  cp -a "${srcdir}"/* "${pkgdir}"/opt/${pkgname}

  msg2 "Installing the start script in /usr/bin..."
  install -dm755 "${pkgdir}"/usr/bin/  
  install -m755 "${srcdir}"/${pkgname} "${pkgdir}"/usr/bin/${pkgname}   

  msg2 "Installing the desktop application entry in /usr/share/applications..."
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
