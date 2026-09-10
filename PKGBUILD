pkgname=kanso-bin
pkgver=0.1.8
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
source_x86_64=("kanso-${pkgver}.tar.gz::https://github.com/psychosomat/Kanso/releases/download/v0.1.8/Kanso-0.1.8-linux-x64.tar.gz"
           "logo512.png::https://raw.githubusercontent.com/psychosomat/Kanso/v0.1.8/public/logo512.png")
sha256sums_x86_64=("ddbfca7690ff503f0f50aee74a87dc4ef118ce1974dcdb6dba1c40f9caa474b3"
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
