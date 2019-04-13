pkgname="lospec-editor-nativefier"
pkgver="0.1"
pkgrel="1"
pkgdesc="The Lospec Pixel Editor is a free, easy to use tool for creating pixel art"
arch=("x86_64")
license=("MIT")
url="https://lospec.com/pixel-editor/app"
makedepends=("nodejs" "npm" "nodejs-nativefier")

source=("${pkgname}.png" "${pkgname}.desktop")
sha256sums=("SKIP" "SKIP")

build() {
    cd "${srcdir}"

    nativefier "https://lospec.com/pixel-editor/app" \
      --icon "${pkgname}.png" \
      --maximize \
      --internal-urls ".*" \
      --name "Lospec Pixel Editor"
}

package() {
  install -dm755 "${pkgdir}/opt/"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -dm755 "${pkgdir}/usr/share/applications"

  cp -rf "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/lospec-editor.desktop"
  cp -rf "${srcdir}/lospec-pixel-editor-linux-x64" "${pkgdir}/opt/"

  ln -sf "/opt/lospec-pixel-editor-linux-x64/microsoft-office-online" "${pkgdir}/usr/bin/lospec-pixel-editor"
  ln -sf "/opt/lospec-pixel-editor-linux-x64/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/lospec-pixel-editor.png"

  chmod 777 "${pkgdir}/opt/lospec-pixel-editor-linux-x64/resources/app/nativefier.json"
}

