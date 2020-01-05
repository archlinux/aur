pkgname="figma-linux"
pkgver="0.6.1"
pkgrel="20"
pkgdesc="The collaborative interface design tool. Unofficial Figma desktop client for Linux"
arch=("x86_64")
url="https://github.com/Figma-Linux/figma-linux"
license=('GPL2')
conflicts=("figma-bin")
replaces=("figma-bin")
source=("https://github.com/Figma-Linux/figma-linux/releases/download/v${pkgver}/figma-linux-${pkgver}.zip"
        "figma-linux.desktop"
        "24x24.png"
        "36x36.png"
        "48x48.png"
        "64x64.png"
        "72x72.png"
        "96x96.png"
        "128x128.png"
        "192x192.png"
        "256x256.png"
        "384x384.png"
        "512x512.png")
depends=("unzip")
noextract=("figma-linux-${pkgver}.zip")

package() {
  cd "${srcdir}"

  install -D "${srcdir}"/figma-linux.desktop "${pkgdir}"/usr/share/applications/figma-linux.desktop
  install -D "${srcdir}"/256x256.png "${pkgdir}"/usr/share/pixmaps/figma-linux.png

  for size in 24 36 48 64 72 96 128 192 256 384 512; do
    install -D "${srcdir}/${size}x${size}.png" \
               "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/figma-linux.png"
  done

  mkdir -p "${pkgdir}/opt/${pkgname}"
  unzip -q "figma-linux-${pkgver}.zip" -d "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/figma-linux" "${pkgdir}/usr/bin/figma"
}
