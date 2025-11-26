# Maintainer: Daniel Serrano <dani.eus79@gmail.com>
pkgname=visagevault-bin
_pkgname=visagevault
pkgver=1.6.8
pkgrel=1
pkgdesc="Gestor de fotografías inteligente con reconocimiento facial (Binario precompilado)"
arch=('x86_64')
url="https://github.com/danitxu79/visagevault"
license=('LGPL3')
provides=('visagevault')
conflicts=('visagevault')
# Dependencias: Como usas PyInstaller, Python va dentro.
# Solo necesitamos dependencias básicas del sistema que suelen estar, pero es bueno listar lo básico.
depends=('glibc' 'gcc-libs' 'zlib')
options=('!strip') # Importante para no romper binarios de PyInstaller

# URL de descarga apuntando a tus Releases de GitHub
# Nota: fpm genera el nombre con guiones, ej: visagevault-1.4-1.x86_64.pkg.tar.zst
source=("https://github.com/danitxu79/visagevault/releases/download/v${pkgver}/VisageVault-${pkgver}-1-x86_64.pkg.tar.zst")

# Para saltar la comprobación de checksums (puedes poner 'SKIP' o generar el sha256sum real con 'sha256sum archivo')
sha256sums=('bb7ad9c0edc54f0addebdea4602a2f4044eb6495767c66ece6b4c9791200cd29')

package() {
    # Como el archivo fuente ya es un paquete de Arch (.pkg.tar.zst),
    # makepkg lo descomprime automáticamente en $srcdir.

    # Simplemente copiamos el contenido descomprimido a la carpeta de instalación final ($pkgdir)

    # Copiar binarios
    install -dm755 "${pkgdir}/usr/bin"
    cp -r "${srcdir}/usr/bin/"* "${pkgdir}/usr/bin/"

    # Copiar aplicaciones (.desktop)
    install -dm755 "${pkgdir}/usr/share/applications"
    cp -r "${srcdir}/usr/share/applications/"* "${pkgdir}/usr/share/applications/"

    # Copiar iconos
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -r "${srcdir}/usr/share/icons/"* "${pkgdir}/usr/share/icons/"

    # Ajustar permisos por seguridad
    chmod 755 "${pkgdir}/usr/bin/VisageVault"
}
