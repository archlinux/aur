# Maintainer: RgeditV1 <angelmiguelparedes@gmail.com>
pkgname=yt-dlp-gui
pkgver=1.0.1
pkgrel=13
pkgdesc="A GUI for yt-dlp written in Python with customtkinter"
arch=("x86_64")
url="https://github.com/RgeditV1/yt-dlp-linux-gui"
license=('MIT')
depends=('python' 'python-customtkinter' 'python-pillow' 'python-plyer' 'yt-dlp')
source=("https://github.com/RgeditV1/yt-dlp-linux-gui/releases/download/stable-${pkgver}/ytdlp_linux_gui.zip"
        "yt-dlp-gui.desktop")
sha256sums=('SKIP' 'SKIP')

package() {
  cd "${srcdir}"

  # Instalar toda la carpeta en /usr/share/yt-dlp-gui
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -r ytdlp_linux_gui/* "${pkgdir}/usr/share/${pkgname}/"

  # Crear wrapper en /usr/bin que ejecute el binario dentro de la carpeta
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/yt-dlp-gui" <<EOF
#!/bin/sh
exec /usr/share/${pkgname}/YTDLP "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/yt-dlp-gui"

  # Instalar el .desktop
  install -Dm644 yt-dlp-gui.desktop \
    "${pkgdir}/usr/share/applications/yt-dlp-gui.desktop"

  # Instalar el icono (ajustado a la ruta dentro de la carpeta)
  install -Dm644 ytdlp_linux_gui/img/icon.png \
    "${pkgdir}/usr/share/pixmaps/yt-dlp-gui.png"
}
