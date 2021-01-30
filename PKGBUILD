# Maintainer: qvshuo

pkgname=wechat-nativefier
pkgver=20210130.2
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
  "c6da6e7166e3df3c6365157a3f22823e8d394b2806eb372b1f8d4b6d3737b2b34bc5a97f8879849030d4fdf5dcd9921a5d7b9376b8d36cd4dd4afa5579a03a39"
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
