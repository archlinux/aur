# Maintainer: acidicX <archlinux-aur@datahugger.de>
pkgname="figma-bin"
pkgver="0.5.2"
pkgrel="1"
pkgdesc="The collaborative interface design tool. Unofficial Figma desktop client for Linux"
arch=("x86_64")
url="https://github.com/ChugunovRoman/figma-linux"
license=('custom: "Copyright Figma, Inc."')
conflicts=("figma-linux-bin")
replaces=("figma-linux-bin")
source=("https://github.com/ChugunovRoman/figma-linux/releases/download/v${pkgver}/figma-linux-${pkgver}.zip"
        "figma.desktop"
        "48x48.png"
        "64x64.png"
        "128x128.png"
        "256x256.png")
depends=("unzip")
noextract=("figma-linux-${pkgver}.zip")
sha256sums=("eb2a655d7395b969e9867db074cc00753c32cd48c92c4b4c78944a3f13893430"
            "30333ab2304e493baf23677b38b775a00f641f78052a761e5dac95f979f860e8"
            "160b8bd5f250bca3f79452b57d2acbe9bad2f68d63b09abeef1f69f4deeed395"
            "3595bd69e9e7a36bf90ad6084462fba2271749afdd7ea080b4cd266d05fafe7b"
            "ee49a1ff77ce0198e700ef42ee817df465884ac713543fc4b78742130fff4b12"
            "ea143a3ad60cbf0e828f5c18ece78fa5c541c71e25668548cca981bfea67c476")

package() {
  cd "${srcdir}"

  install -D "${srcdir}"/figma.desktop "${pkgdir}"/usr/share/applications/figma.desktop
  install -D "${srcdir}"/256x256.png "${pkgdir}"/usr/share/pixmaps/figma.png

  for size in 48 64 128 256; do
    install -D "${srcdir}/${size}x${size}.png" \
               "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/figma.png"
  done

  mkdir -p "${pkgdir}/opt/${pkgname}"
  unzip -q "figma-linux-${pkgver}.zip" -d "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/figma-linux" "${pkgdir}/usr/bin/figma"
}
