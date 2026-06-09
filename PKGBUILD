# Maintainer: Ignacio <Nacho-Telmo>
pkgname=sinergia-dd-burner
pkgver=1.0.0
pkgrel=2
pkgdesc="Grabador de imágenes ISO a unidades USB seguro y minimalista"
arch=('any')
url="https://github.com/Nacho-Telmo/Sinergia"
license=('GPL3')
depends=('python' 'python-pyqt6' 'coreutils')
source=("app.py" "dd-burner.png" "LICENSE")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    # 1. Crear directorios
    install -d "${pkgdir}/usr/lib/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/pixmaps"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"

    # 2. Instalar archivos desde la raíz
    install -m755 "${srcdir}/app.py" "${pkgdir}/usr/lib/${pkgname}/main.py"
    install -m644 "${srcdir}/dd-burner.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # 3. Crear el script lanzador
    echo -e "#!/bin/sh\nexec python /usr/lib/${pkgname}/main.py \"\$@\"" > "${pkgdir}/usr/bin/${pkgname}"
    chmod +x "${pkgdir}/usr/bin/${pkgname}"

    # 4. Crear archivo .desktop
    cat << EOF > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
[Desktop Entry]
Name=Sinergia DD Burner
Exec=${pkgname}
Icon=${pkgname}
Type=Application
Categories=Utility;System;
Comment=Escribe ISOs a unidades USB de forma segura
EOF
}
