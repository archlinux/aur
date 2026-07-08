# Maintainer: Lasse Vestergaard <hello@lassejlv.dk>
pkgname=termy-bin
pkgver=0.2.11
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
b2sums=('738786226fbd6f9f327770372565806caf1aee1a8bd92fb5b5886817db47125732b0565524a35391f71a080242272c91814aaa3007f94fa40d776064449bdfa1'
        '310d92f8a26968092eab7c5434701e6c2a8cbb40d0179f12031eb755f1bf743bb3d52e678000a30b247eb7a0c29d81ad38d8c4d042aef6d1beb18707aaefa4f8'
        '80218e225990c0dbd7975f5d65d75bb607af915b1773fde40af216240a3ac08ddf293ce5a735b64bbae29d040b93153f4d36076a3df359b8a01c64c73582958b')

package() {
  # The tarball extracts to a directory named "termy", and inside that is the "termy" binary
  cd "$srcdir/termy"

  # Install the binary
  install -Dm755 "termy" "$pkgdir/usr/bin/termy"

  # Install desktop file and icon
  install -Dm644 "$srcdir/termy.desktop" "$pkgdir/usr/share/applications/termy.desktop"
  install -Dm644 "$srcdir/termy_icon.png" "$pkgdir/usr/share/pixmaps/termy.png"
}
