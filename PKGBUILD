# Maintainer: qvshuo

pkgname=wechat-nativefier
pkgver=20210130.5
pkgrel=1
pkgdesc="Built with nativefier (electron), seemed to Windows version."
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
  "1d7f3f2b11f689b22149b369dd1d6261c2c5ffc77a27e5351596597d790a1066a1765511975e8260188db8d48f8c5dbabb2375dba60027316c8e3809591c9b4f"
  "a2102da15457059aeb60636246ee1557aa8a7833af1ebdc28661d1541bc563b0e14710261736890e4b59089249914171d3fdb8212217d8778626366c1290d9d0"
)

_instname=WeChat

build() {
  nativefier \
      --name "$_instname" \
    --icon "${pkgname}.png" \
    --inject "${pkgname}.css" \
    --hide-window-frame \
    --tray \
    --file-download-options '{"saveAs": true}' \
    "${url}"
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}
