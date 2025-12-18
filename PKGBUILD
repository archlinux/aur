# Maintainer: AnabasaSoft <anabasasoft@gmail.com>
pkgname=cloudmount-wizard-bin
_pkgname=cloudmount-wizard
pkgver=1.2
pkgrel=1  # He subido la "release" del paquete a 2 porque es una corrección
pkgdesc="Asistente para montar unidades de nube (Mega, Drive, etc) en Linux (Binario)"
arch=('x86_64')
url="https://github.com/AnabasaSoft/CloudMount-Wizard"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('rclone' 'fuse3' 'libglvnd' 'libx11' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libxkbcommon' 'wayland')

# AHORA DESCARGAMOS EL BINARIO Y TAMBIÉN EL ICONO
source=(
    "$url/releases/download/v$pkgver/cloudmount-linux-amd64.tar.gz"
    "cloudmount.png::https://raw.githubusercontent.com/AnabasaSoft/CloudMount-Wizard/main/icon.png"
)

# IMPORTANTE: Calcula los checksums reales con 'sha256sum archivo'
# Si te da pereza ahora, usa 'SKIP' para probar, pero AUR te pedirá los reales al subir.
sha256sums=('b8d2ce91e8da8b3e5fd3b2d1e35704f858edecfeac8b61a5affe66c12d06e99c'
            '93a3103e8c27ca2f913efa775a44422f714f4e9cb514e162c49d454736bb3bf6')

package() {
    # 1. Instalar el BINARIO en /usr/bin
    install -Dm755 "${srcdir}/CloudMount-Wizard" "${pkgdir}/usr/bin/${_pkgname}"

    # 2. Instalar el ICONO en /usr/share/pixmaps
    install -Dm644 "${srcdir}/cloudmount.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    # 3. Crear e instalar el archivo .DESKTOP en /usr/share/applications
    # Esto es lo que hace que aparezca en el menú
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=CloudMount Wizard
Comment=Gestor gráfico de nubes para Rclone
Exec=${_pkgname}
Icon=${_pkgname}
Terminal=false
Categories=Utility;Network;FileTools;
Keywords=rclone;cloud;mount;drive;mega;
StartupNotify=false
EOF
}
