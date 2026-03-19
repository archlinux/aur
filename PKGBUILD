# Maintainer: c3rt1fiedd <slitchio0@gmail.com>
# Contributor: rgeditv1
pkgname=yt-dlp-gui
pkgver=1.0.4
pkgrel=1
pkgdesc="A GUI for yt-dlp written in Python with customtkinter"
arch=("x86_64")
url="https://github.com/RgeditV1/yt-dlp-linux-gui"
license=('MIT')
depends=('python' 'python-customtkinter' 'python-pillow' 'python-plyer' 'yt-dlp')
source=("https://github.com/RgeditV1/yt-dlp-linux-gui/releases/download/v${pkgver}/YTDLP-GUI-linux.zip"
        "yt-dlp-gui.desktop")

sha256sums=('ed8c5e5928f8eeea0804badbe0d5a6c6f9af471ef3e9061f6e55a64c57b32b1e'
            'fb8f1b7733e46aa8f497038e275d7930d608edb05df87020adddfa17ec881d71')

package() {
  cd "${srcdir}"

  # Install the entire folder in /usr/share/yt-dlp-gui
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -r YTDLP-GUI-linux/* "${pkgdir}/usr/share/${pkgname}/"

  # Create wrapper in /usr/bin
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/yt-dlp-gui" <<'EOF'
#!/bin/sh
# Export SSL certificates so that the binary can find them
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
exec /usr/share/yt-dlp-gui/YTDLP "$@"
EOF
  chmod +x "${pkgdir}/usr/bin/yt-dlp-gui"

  # Install the .desktop
  install -Dm644 yt-dlp-gui.desktop \
    "${pkgdir}/usr/share/applications/yt-dlp-gui.desktop"

  # Install the icon from the img folder
  install -Dm644 YTDLP-GUI-linux/img/icon.png \
    "${pkgdir}/usr/share/pixmaps/yt-dlp-gui.png"
}
