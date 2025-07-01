# Maintainer: Jorge Arévalo Fernández <jorjai@jorjai.net>
pkgname=soundbound-app-bin
pkgver=1.1.8
pkgrel=1
pkgdesc="A cross-platform media player with plugin support for custom content sources."
arch=('x86_64')
url="https://soundbound.app/"
license=('unknown')
provides=('soundbound-app')
conflicts=('soundbound-app')
depends=(
    'alsa-lib'
    'brotli'
    'libbsd'
    'bzip2'
    'glibc'
    'expat'
    'fontconfig'
    'freetype2'
    'mesa'
    'libglvnd'
    'libpng'
    'libx11'
    'libxau'
    'libxcb'
    'libxdmcp'
    'libxext'
    'libxi'
    'libxrender'
    'libxtst'
    'xdg-utils'
    'zlib'
)
source=("https://github.com/Shabinder/soundbound-extensions-lib/releases/download/${pkgver}/Soundbound-${pkgver}-x64-linux-portable.deb")
sha256sums=('a9c924eac9b1c30b81afe44f48a39c89ef23e9995203c8f1046a13563584f840')

package() {
    bsdtar -xf "${srcdir}/Soundbound-${pkgver}-x64-linux-portable.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}/"

    install -d "${pkgdir}/usr/bin"
    ln -sf /opt/soundbound/bin/Soundbound "${pkgdir}/usr/bin/soundbound"

    # Copiar icono a ruta estándar de Arch
    install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    install -m 644 "${pkgdir}/opt/soundbound/lib/Soundbound.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/soundbound.png"

    # Crear directorio para desktop files
    install -d "${pkgdir}/usr/share/applications"

    # Crear archivo .desktop
    cat << EOF > "${pkgdir}/usr/share/applications/soundbound.desktop"
[Desktop Entry]
Name=Soundbound
Comment=Cross-platform media player with plugin support
Exec=/usr/bin/soundbound
Icon=soundbound
Terminal=false
Type=Application
Categories=AudioVideo;Player;Audio;
EOF
}


