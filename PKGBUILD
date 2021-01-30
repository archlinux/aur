# Maintainer: qvshuo

pkgname=wechat-nativefier
pkgver=20210130.1
pkgrel=1
pkgdesc="WeChat desktop built with nativefier (electron)"
arch=("x86_64")
url="https://wx.qq.com/"
license=("MIT")
makedepends=("nodejs-nativefier")
source=(
  "${pkgname}.css"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
sha512sums=(
  "a5cbabd4eb17c89fe7cee345a5a3a3263306e6510ad34b06f6cee1f9221da18d7d38158a8e9cd102efe7f220efe862a8ec08d7422840e5587b19e611667280c2"
  "9195f78fd33008091e4c88462e5c5c1c7ed5fe4193fb18b8d62da12bc401ef03fdfdc798c69de7efbc208abf4278a0a9f9d1426fad6eae2c27cadc7e14f8bec3"
  "a2102da15457059aeb60636246ee1557aa8a7833af1ebdc28661d1541bc563b0e14710261736890e4b59089249914171d3fdb8212217d8778626366c1290d9d0"
)

build() {
  nativefier \
    --name "${pkgname}" \
    --icon "${pkgname}.png" \
    --inject "${pkgname}.css" \
    --hide-window-frame \
    --tray \
    --file-download-options '{"saveAs": true}' \
    "${url}"
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

    cp -rL $pkgname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}