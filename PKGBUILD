# Maintainer: Lasse Vestergaard <hello@lassejlv.dk>
pkgname=termy-bin
pkgver=0.2.30
pkgrel=1
pkgdesc="Minimal GPUI-powered terminal (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/lassejlv/termy"
license=('MIT')
depends=('bash' 'glibc' 'gcc-libs' 'glib2'
         'freetype2' 'fontconfig' 'libxcb' 'wayland' 'libxkbcommon'
         'libxkbcommon-x11' 'vulkan-icd-loader')
provides=('termy')
conflicts=('termy')
source=("termy.desktop"
        "LICENSE::https://raw.githubusercontent.com/lassejlv/termy/v${pkgver}/LICENSE"
        "termy_icon.png::https://raw.githubusercontent.com/lassejlv/termy/v${pkgver}/assets/termy_icon.png")
b2sums=('310d92f8a26968092eab7c5434701e6c2a8cbb40d0179f12031eb755f1bf743bb3d52e678000a30b247eb7a0c29d81ad38d8c4d042aef6d1beb18707aaefa4f8'
        '0128ba93a8dc10df25286bd85db9df93ef7ad68abd077d895ba29c2b1af7eca9530dc7146f0941ff128738416e2319ed3f906ac3525f26eff2589be9369149eb'
        '846adc793544028ef1bb111802a2e61013f6a0623f86d8546e27210ded24b1ef367e73ea4cda56a15f40c85a893d2f5c8288bbde035c9d77aa53d2fd223ead90')
source_x86_64=("termy-${pkgver}-${CARCH}.tar.gz::https://github.com/lassejlv/termy/releases/download/v${pkgver}/Termy-v${pkgver}-linux-${CARCH}.tar.gz")
b2sums_x86_64=('fd14f7a2867828527d758b6d0b1c481ef14a4dd19e90094a2b05c90c3a14ad756e22dc3e62a94b56ffe7c9a48d9447c9eb5d94fbfc8459073500117d95fe71a8')

package() {
  cd "$srcdir/termy"

  # The launcher execs the sibling termy-bin binary, and the CLI integration
  # expects termy-cli to be installed alongside it.
  install -Dm755 "termy" "$pkgdir/usr/bin/termy"
  install -Dm755 "termy-bin" "$pkgdir/usr/bin/termy-bin"
  install -Dm755 "termy-cli" "$pkgdir/usr/bin/termy-cli"

  # Install desktop file and icon
  install -Dm644 "$srcdir/termy.desktop" "$pkgdir/usr/share/applications/termy.desktop"
  install -Dm644 "$srcdir/termy_icon.png" "$pkgdir/usr/share/pixmaps/termy.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
