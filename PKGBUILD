# Maintainer: Tu Nombre <tu_email@dominio.com>
pkgname=portaldrop-bin
_pkgname=portaldrop
pkgver=1.3
pkgrel=1
pkgdesc="AirDrop universal para Linux (Sin instalar nada en el móvil)"
arch=('x86_64')
url="https://github.com/danitxu79/PortalDrop" # <--- Tu URL del repo
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'zlib' 'fuse2') # fuse2 es a veces necesario para AppImages/Binarios, o 'libglvnd' para Qt
makedepends=()
options=('!strip') # Importante para binarios de PyInstaller para no romperlos

source=(
    "${_pkgname}::${url}/releases/download/v${pkgver}/${_pkgname}"
    "${_pkgname}.png::https://raw.githubusercontent.com/danitxu79/PortalDrop/main/portaldrop-512.png"
)

# Nota: Deberás generar estos hash con 'updpkgsums' o 'makepkg -g'
sha256sums=('b24a32484ed751974f073f968b45db6e7172d37a93f78d6353af5f86e6d3e62c'
            '5a3caf47e0012f35afdb9cdbafe3c19d37f5383b60b62f705994279ed626e2a8')

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
