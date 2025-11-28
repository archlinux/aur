# Maintainer: Daniel Serrano Armenta <anabasasoft@gmail.com>
pkgname=portaldrop-bin
_pkgname=portaldrop
pkgver=1.6.2
pkgrel=1
pkgdesc="AirDrop universal para Linux. Transfiere archivos por WiFi vía QR sin instalar nada en el móvil (Python/Qt6)"
arch=('x86_64')
url="https://github.com/anabasasoft/PortalDrop" # <--- Tu URL del repo
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'zlib' 'fuse2') # fuse2 es a veces necesario para AppImages/Binarios, o 'libglvnd' para Qt
makedepends=()
options=('!strip') # Importante para binarios de PyInstaller para no romperlos

source=(
    "${_pkgname}::${url}/releases/download/v${pkgver}/${_pkgname}"
    "${_pkgname}.png::https://raw.githubusercontent.com/anabasasoft/PortalDrop/main/portaldrop-512.png"
    "${_pkgname}.metainfo.xml::https://raw.githubusercontent.com/anabasasoft/PortalDrop/main/portaldrop.metainfo.xml"
)

# Nota: Deberás generar estos hash con 'updpkgsums' o 'makepkg -g'
sha256sums=('ad11c471562e6344089390bc2e7e225b4cb1e77688bc4256e21c4d4109ca84fc'
            '5a3caf47e0012f35afdb9cdbafe3c19d37f5383b60b62f705994279ed626e2a8'
            'f071a18f080afd494f001e89b4ecfb4c044f7a3a53b7b35da9580a98081ddd35')

package() {
    # 1. Instalar el binario
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # 2. Instalar el icono
    install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    # 3. Crear el archivo .desktop
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=PortalDrop
Comment=AirDrop universal para Linux
Exec=/usr/bin/${_pkgname}
Icon=${_pkgname}
Categories=Utility;Network;FileTransfer;
Terminal=false
StartupWMClass=PortalDrop
EOF
}
