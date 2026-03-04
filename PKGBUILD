# Maintainer: Lasse Vestergaard <hello@lassejlv.dk>
pkgname=termy-bin
pkgver=0.1.37
pkgrel=1
pkgdesc="Minimal GPUI-powered terminal (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/lassejlv/termy"
license=('MIT')
depends=('glibc' 'gcc-libs' 'freetype2' 'fontconfig' 'wayland' 'libxkbcommon' 'vulkan-icd-loader')
provides=('termy')
conflicts=('termy')
source=("termy-${pkgver}.tar.gz::https://github.com/lassejlv/termy/releases/download/v${pkgver}/Termy-v${pkgver}-linux-x86_64.tar.gz"
        "termy.desktop"
        "termy_icon.png::https://raw.githubusercontent.com/lassejlv/termy/v${pkgver}/assets/termy_icon.png")
b2sums=('b8490702ebb2229e2155079b304dab8c1d3c86122246cb9c1f21e015bd0f2d93b369d74fa55e855b2ea9db5bddf228dee2afdf028f860a1c872d1540ec8777b6'
        '310d92f8a26968092eab7c5434701e6c2a8cbb40d0179f12031eb755f1bf743bb3d52e678000a30b247eb7a0c29d81ad38d8c4d042aef6d1beb18707aaefa4f8'
        '9d27df18af7c50fcbc788f574a614ddb7ac479a584093a78070e2b9cafbdd85c0f4a9214d0475922d175f407ab0e84444ce471b21ce9279aac4206904f4240b3')

package() {
  # The tarball extracts to a directory named "termy", and inside that is the "termy" binary
  cd "$srcdir/termy"
  
  # Install the binary
  install -Dm755 "termy" "$pkgdir/usr/bin/termy"
  
  # Install desktop file and icon
  install -Dm644 "$srcdir/termy.desktop" "$pkgdir/usr/share/applications/termy.desktop"
  install -Dm644 "$srcdir/termy_icon.png" "$pkgdir/usr/share/pixmaps/termy.png"
}
