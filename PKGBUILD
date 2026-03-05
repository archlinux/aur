# Maintainer: Lasse Vestergaard <hello@lassejlv.dk>
pkgname=termy-bin
pkgver=0.1.43
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
b2sums=('36a160854a2c6231f2198fd39370d76d7ba643b509041102a469623480069804b1e86f58027f6a6230e0aec0205c8f96da9a6d7a1e0ad953f77608ef54cb0beb'
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
