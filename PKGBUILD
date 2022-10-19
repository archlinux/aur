# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: mstmob
# Contributor: xiota

_pkgname=cura
pkgname=$_pkgname-bin
pkgver=5.2.0
pkgrel=1
pkgdesc='State-of-the-art slicer app to prepare your 3D models for your 3D printer'
url='https://ultimaker.com/software/ultimaker-cura'
license=('LGPL3')
arch=('x86_64')
depends=('fuse2' 'xdg-desktop-portal' 'xdg-desktop-portal-gtk')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')

source=(
  "https://github.com/Ultimaker/Cura/releases/download/${pkgver}/Ultimaker-Cura-${pkgver}-linux-modern.zip"
  'cura.sh'
  'cura-engine.sh'
)

sha512sums=(
  '9ba8572b450862472f7463863f60daa5ec28335673a803747c48bd737d0c18e1bb826073a866e24921fc0ec6fadba4b7478f275c3483083ea0f67dfef9740530'
  '2ee8fe687ebb5c67204041b7e4a056766e66fa3331466d2e332726ee2c28d05aa307eb17ccc6701cda25ad8c096520ba25f962fe78797933520f7c5ae7b7184c'
  'dfddc5055017171ca4a9dac91b08b17e8d6585ae0211321fef7ea891b2c4b6f7f8a1a8b8de189a3cb7da104870c9db1fb4ee6cb7234f198b3d4a5d4bf7671dd8'
)

prepare() {
  [[ -d squashfs-root ]] && rm -rf squashfs-root
  chmod 755 Ultimaker-Cura-${pkgver}-linux-modern.AppImage
  ./Ultimaker-Cura-${pkgver}-linux-modern.AppImage --appimage-extract
}

package() {
  install -Dm755 cura.sh "$pkgdir/usr/bin/Ultimaker-Cura"
  install -Dm755 cura-engine.sh "$pkgdir/usr/bin/CuraEngine"
  install -Dm644 squashfs-root/cura.desktop "$pkgdir/usr/share/applications/cura.desktop"
  install -Dm644 squashfs-root/cura-icon.png "$pkgdir/usr/share/pixmaps/cura-icon.png"
  install -dm755 "$pkgdir/opt"
  mv squashfs-root "$pkgdir/opt/ultimaker-cura"
}
