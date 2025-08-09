pkgname=ytdl_gui
pkgver=1.0.0
pkgrel=1
pkgdesc="Interface gráfica para o yt-dlp feita em Flutter"
arch=('x86_64')
url="https://github.com/iagolbdc/ytdl-gui"
license=('MIT')
depends=('gtk3' 'glib2' 'libx11' 'libxext' 'libxrandr' 'libxcursor' 'libxi' 'libgl' 'fontconfig')
source=("$url/releases/download/v${pkgver}/ytdl_gui-${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.install"
        "LICENSE")
sha256sums=('7a621803bfb24db3e2e3c0b94d35d5c157d8d5aca4b2f02cccdb40f238375c73'
            'a20ec1a9ecd64fa7e6acd845f27275cad97c62c308eddfe6db0c2fd414a95a60'
            'c48c773d1c80b9ece347ccf3053b9934a26e27d166038aa89410cdad235fad39'
            '5b70eb305c0463926f74c972722126b96ede6219402051726819de6b2556c16d')
install="${pkgname}.install"

package() {
  install -d "$pkgdir/opt/${pkgname}"
  tar -xzf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "$pkgdir/opt/${pkgname}" --strip-components=1

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  if [[ -f "$pkgdir/opt/${pkgname}/data/flutter_assets/assets/logo.png" ]]; then
    install -Dm644 "$pkgdir/opt/${pkgname}/data/flutter_assets/assets/logo.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  fi
}
