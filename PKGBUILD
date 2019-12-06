pkgname="figma-linux"
pkgver="0.6.1"
pkgrel="16"
pkgdesc="The collaborative interface design tool. Unofficial Figma desktop client for Linux"
arch=("x86_64")
url="https://github.com/Figma-Linux/figma-linux"
license=('GPL2')
conflicts=("figma-bin")
replaces=("figma-bin")
source=("https://github.com/Figma-Linux/figma-linux/releases/download/v${pkgver}/figma-linux-${pkgver}.zip"
        "figma.desktop"
        "48x48.png"
        "64x64.png"
        "128x128.png"
        "256x256.png")
depends=("unzip")
noextract=("figma-linux-${pkgver}.zip")
sha256sums=("2ee8b30221228739a26ccd4a0663fc16274899032203c6533773cddaeb5f389a"
            "3f87a98dad8c5b76d350d9fa7858f1d5586c1e21c78a675a9e3899ab294add38"
            "72d0c9df5b81a7666a05751a38fe096f629096be73792355f6069024cf7c0412"
            "780219a3792c5c4160829e7a8023e16f78e12c807762d7217a9db90e43a3f777"
            "86f34a8d9ddfdcfad5cc5e170a729cee7bca61102fbe0b10746b7f83b19d45bc"
            "1db635df7d84f73694303eba423acd75da892e084cf35c4e260bd5c6b56fcc1e")

package() {
  cd "${srcdir}"

  install -D "${srcdir}"/figma.desktop "${pkgdir}"/usr/share/applications/figma.desktop
  install -D "${srcdir}"/256x256.png "${pkgdir}"/usr/share/pixmaps/figma-linux.png

  for size in 48 64 128 256; do
    install -D "${srcdir}/${size}x${size}.png" \
               "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/figma-linux.png"
  done

  mkdir -p "${pkgdir}/opt/${pkgname}"
  unzip -q "figma-linux-${pkgver}.zip" -d "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/figma-linux" "${pkgdir}/usr/bin/figma"
}
