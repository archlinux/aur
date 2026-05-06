pkgname=kibo-appimage
pkgver=1.1.7
pkgrel=2
pkgdesc="Kibo Anime AppImage - Application for watching anime"
arch=('x86_64')
url="https://kiboanime.app"
license=('custom')
depends=('fuse2')
options=(!strip)

source=(
  "${pkgname}-${pkgver}.AppImage::https://apk.kiboanime.app/downloadpc/Kibo-${pkgver}.AppImage"
  "kibo.svg::https://www.kiboanime.app/group-2.svg"
  "kibo.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/kibo/kibo.desktop"
)

sha256sums=('389bde34622f5b8469ad72ca7d26ff0de60012981bf9876a80cfa2c57a0a5b7d'
            'bbe7aef71d090ed5eabc7b2933431990ce8e5253ea3123d3695cd2264434bbd6'
            '3f3472b09fa34c77f238efa75ea8da528c969ef67e7ec062699f97f5c90533aa')

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

  install -Dm644 \
    "${srcdir}/kibo.desktop" \
    "${pkgdir}/usr/share/applications/kibo.desktop"

  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
This package redistributes the Kibo Anime AppImage.

Upstream project:
https://kiboanime.app

License terms and conditions are provided by the upstream project.
EOF
}
