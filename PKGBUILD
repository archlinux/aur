# Maintainer: cleboost
pkgname=kibo-appimage
pkgver=1.1.6
pkgrel=1
pkgdesc="Kibo Anime AppImage - Application for watching anime"
arch=('x86_64')
url="https://kiboanime.app"
license=('custom')
depends=('fuse2')
options=(!strip)

source=(
  "${pkgname}-${pkgver}.AppImage::https://apk.kiboanime.app/downloadpc/Kibo-${pkgver}.AppImage"
  "kibo.svg::https://www.kiboanime.app/group-2.svg"
)

sha256sums=('3a79f9364d3da21967aa8c0b8b8b251cf06341721c132ce1e350593a53b5082d'
            'bbe7aef71d090ed5eabc7b2933431990ce8e5253ea3123d3695cd2264434bbd6')

prepare() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
}

package() {
  install -Dm755 \
    "${srcdir}/${pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/opt/${pkgname}/kibo.AppImage"

  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/kibo.AppImage" "${pkgdir}/usr/bin/kibo"

  install -Dm644 \
    "${srcdir}/kibo.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/kibo.svg"

  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/kibo.desktop" <<EOF
[Desktop Entry]
Name=Kibo Anime
Comment=Application for watching anime
Exec=kibo
Icon=kibo
Terminal=false
Type=Application
Categories=AudioVideo;Video;Player;
EOF

  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
This package redistributes the Kibo Anime AppImage.

Upstream project:
https://kiboanime.app

License terms and conditions are provided by the upstream project.
EOF
}
