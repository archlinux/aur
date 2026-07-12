# Maintainer: Lasse Vestergaard <hello@lassejlv.dk>
pkgname=termy-bin
pkgver=0.2.18
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
        'eb0f91e8423717f959cfa0395b009687899f9f2083667d04cf18b27de35bfa9c53e68a9a4d2c4432da168a033db21c6505abdf78e603121c2f004c0366ab5b8b')
source_x86_64=("termy-${pkgver}-${CARCH}.tar.gz::https://github.com/lassejlv/termy/releases/download/v${pkgver}/Termy-v${pkgver}-linux-${CARCH}.tar.gz")
b2sums_x86_64=('8ebab3d6aa8f975750d9344f5ec2cb98de5d3b43581a5fdbdf2ad471cb4b1b0e062a348a31b0b5a9d898f14a069265ed43aa087093d710382276ab5c7a05e0b9')

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
