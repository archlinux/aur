# Maintainer Xuanwo <xuanwo@archlinucn.org>
pkgname=clickup
pkgver=2.0.20
pkgrel=1
pkgdesc="Desktop app for clickup.com"
arch=('x86_64')
url="https://clickup.com"
license=('custom')
depends=('fuse2')
_filename="$pkgname-desktop-$pkgver-x86_64.AppImage"
source=("https://github.com/clickup/clickup-release/releases/download/v${pkgver}/${_filename}")
options=('!strip')

prepare() {
  rm -rf squashfs-root
  chmod +x $_filename
  ./$_filename --appimage-extract
  sed -i -e "s|Exec=.\+|Exec=/opt/$_filename %U|" squashfs-root/clickup-desktop.desktop
}

package() {
  install -Dm755 $_filename "$pkgdir/opt/$_filename"
  install -Dm644 squashfs-root/clickup-desktop.desktop "$pkgdir/usr/share/applications/clickup.desktop"
  install -Dm644 squashfs-root/clickup-desktop.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/clickup-desktop.png"
  chmod -R a+rX "$pkgdir/usr/share/icons/hicolor"
}

sha512sums=('ad6a2ab6bff8d1b85d45b2e95017485000bf39f1ab45bec4fc950125a36d902b0b7c8c39ba0ae0bd9fe99a9a378d624b12538f2e66e6ca71376b49641a7bf632')
