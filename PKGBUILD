# Maintainer: Warre Snaet <warresnaet@icloud.com>
pkgname=termy-bin
pkgver=0.1.27
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
b2sums=('b22f6cd6e004da12120d901a3f5e9d223255e5f060039e2082177db54af6bf05728d25d1ef24f39b6040366eaa07bbc05ff82433c341655a333e7016060ac72d'
        '310d92f8a26968092eab7c5434701e6c2a8cbb40d0179f12031eb755f1bf743bb3d52e678000a30b247eb7a0c29d81ad38d8c4d042aef6d1beb18707aaefa4f8'
        '7acc0c66d7ba264a6042f7f43815860ed23d987f60fd578c97f4cfcaca7dfc83c33b8d887522447659f7e3e1ba2c5c4eba979594474675f5523c2462610f7669')

package() {
  # The tarball extracts to a directory named "termy", and inside that is the "termy" binary
  cd "$srcdir/termy"
  
  # Install the binary
  install -Dm755 "termy" "$pkgdir/usr/bin/termy"
  
  # Install desktop file and icon
  install -Dm644 "$srcdir/termy.desktop" "$pkgdir/usr/share/applications/termy.desktop"
  install -Dm644 "$srcdir/termy_icon.png" "$pkgdir/usr/share/pixmaps/termy.png"
}
