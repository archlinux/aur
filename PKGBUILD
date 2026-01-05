# Maintainer: Tu Nombre <tuemail@ejemplo.com>
pkgname=opentranscribe-bin
pkgver=2.0.5
pkgrel=1
pkgdesc="Herramienta de transcripción automática offline usando Whisper.cpp (Binario)"
arch=('x86_64')
url="https://github.com/anabasasoft/OpenTranscribe"
license=('MIT') # O la licencia que uses
depends=('ffmpeg' 'hicolor-icon-theme') # Dependencias del sistema
provides=('opentranscribe')
conflicts=('opentranscribe')

# Descargamos: 1. El binario, 2. El icono
source=("https://github.com/anabasasoft/OpenTranscribe/releases/download/v${pkgver}/OpenTranscribe"
        "https://raw.githubusercontent.com/anabasasoft/OpenTranscribe/main/icon.png")

# Las sumas de verificación se llenarán automáticamente luego
sha256sums=('fa3f51cfeb77a44c131668ea17231666d86078e11ee7ff758b2e79e8e0b18d1f'
            'f5c0ec7f25e12ce72874bafc66473a3b1b878f529da1a1133b5a48b0dc0fbadf')

package() {
    # 1. Instalar el binario en /usr/bin
    install -Dm755 "${srcdir}/OpenTranscribe" "${pkgdir}/usr/bin/opentranscribe"

    # 2. Instalar el icono
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/opentranscribe.png"

    # 3. Generar e instalar el archivo .desktop (Igual que en tu GitHub Action)
    mkdir -p "${pkgdir}/usr/share/applications"
    cat <<EOF > "${pkgdir}/usr/share/applications/opentranscribe.desktop"
[Desktop Entry]
Name=OpenTranscribe
Comment=Herramienta de transcripción automática con IA
Exec=/usr/bin/opentranscribe %f
Icon=opentranscribe
Terminal=false
Type=Application
Categories=AudioVideo;Audio;Utility;
MimeType=audio/mpeg;audio/x-wav;video/mp4;video/x-matroska;
Keywords=transcription;whisper;subtitles;
StartupNotify=true
EOF
    chmod 644 "${pkgdir}/usr/share/applications/opentranscribe.desktop"
}
