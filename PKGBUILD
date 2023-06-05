# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: vivaeltopo

_pkgname=upscayl
pkgname=$_pkgname-bin
pkgver=2.5.5
pkgrel=1
pkgdesc='Free and Open Source AI Image Upscaler'
url='https://github.com/upscayl/upscayl'
license=('AGPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('fuse2' 'nss' 'zlib')
makedepends=('util-linux')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
source=("https://github.com/upscayl/upscayl/releases/download/v${pkgver}/upscayl-${pkgver}-linux.AppImage")
sha512sums=('83773b8040a46455caf31162e4455dd50ac07dc07813ddf0aa6c5f825bd61c82ee91f097391af8d74fcc67f839eae836ce78347a802a4327da6be279d5385bdd')

prepare() {
  [[ -d squashfs-root ]] && rm -rf squashfs-root
  chmod 755 upscayl-${pkgver}-linux.AppImage
  ./upscayl-${pkgver}-linux.AppImage --appimage-extract
  sed -i 's|^Exec=.*|Exec=upscayl|' squashfs-root/upscayl.desktop
}

package() {
  install -Dm644 squashfs-root/usr/share/icons/hicolor/0x0/apps/upscayl.png "$pkgdir/usr/share/pixmaps/upscayl.png"
  install -Dm644 squashfs-root/upscayl.desktop "$pkgdir/usr/share/applications/upscayl.desktop"
  install -Dm755 upscayl-${pkgver}-linux.AppImage "$pkgdir/usr/bin/$_pkgname"
}
