pkgname=kanso-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Modern media player focused on convenience, beauty, and performance"
arch=("x86_64")
url="https://github.com/psychosomat/Kanso"
license=("MIT")
depends=(
  "gtk3"
  "libsecret"
  "nss"
  "alsa-lib"
)
optdepends=(
  "ffmpeg: broader codec support from the system stack"
)
provides=("kanso")
conflicts=("kanso")
source_x86_64=("kanso-${pkgver}.tar.gz::https://github.com/psychosomat/Kanso/releases/download/v${pkgver}/Kanso-${pkgver}-linux-x64.tar.gz"
           "logo512.png::https://raw.githubusercontent.com/psychosomat/Kanso/v${pkgver}/public/logo512.png")
sha256sums_x86_64=("eb3431df2657ee52977f38d72a30ee002a76448967f265ce9f60282bda00fadd"
             "SKIP")

package() {
  install -dm755 "${pkgdir}/opt/kanso"
  cp -a "${srcdir}/Kanso-${pkgver}-linux-x64/"* "${pkgdir}/opt/kanso/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/kanso/kanso" "${pkgdir}/usr/bin/kanso"

  install -Dm644 "${srcdir}/logo512.png" \
    "${pkgdir}/usr/share/pixmaps/kanso.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/kanso.desktop" <<'DESKTOP'
[Desktop Entry]
Name=Kanso
Exec=/usr/bin/kanso %U
Terminal=false
Type=Application
Icon=kanso
StartupWMClass=Kanso
Categories=AudioVideo;Video;
MimeType=video/mp4;video/x-matroska;video/webm;video/quicktime;video/x-msvideo;video/x-m4v;video/mp2t;
DESKTOP
}
