# Maintainer: AnabasaSoft <anabasasoft@gmail.com>
pkgname=mantpro-bin
pkgver=1.2
pkgrel=1
pkgdesc="Sistema Integral de Mantenimiento Industrial (Cliente de Escritorio)"
arch=('x86_64')
url="https://github.com/AnabasaSoft/MantPro"
license=('MIT')
provides=('mantpro')
conflicts=('mantpro')
# Dependencias mínimas para el binario compilado (glibc y zlib son base en Arch)
depends=('glibc' 'zlib')
options=('!strip')

# Descargamos el binario compilado por GitHub Actions y el icono del repo
source_x86_64=("https://github.com/AnabasaSoft/MantPro/releases/download/v${pkgver}/MantPro_Linux"
               "https://raw.githubusercontent.com/AnabasaSoft/MantPro/main/icono.png")

# Usamos SKIP para evitar errores de checksum antes de que GitHub compile la release
sha256sums_x86_64=('SKIP'
                   'SKIP')

package() {
    # 1. Instalar el binario renombrándolo a 'mantpro' en /usr/bin
    install -Dm755 "MantPro_Linux" "${pkgdir}/usr/bin/mantpro"

    # 2. Instalar el icono en /usr/share/pixmaps
    install -Dm644 "icono.png" "${pkgdir}/usr/share/pixmaps/mantpro.png"

    # 3. Crear el archivo .desktop AL VUELO
    # Esto define cómo se ve la app en el menú de inicio (KDE/Gnome/etc)
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/mantpro.desktop" <<EOF
[Desktop Entry]
Type=Application
Version=1.2
Name=MantPro
GenericName=Gestión de Mantenimiento
Comment=Control de tareas, calendario y sincronización móvil
Exec=mantpro
Icon=mantpro
Terminal=false
Categories=Office;Utility;
StartupWMClass=MantPro
EOF
}
