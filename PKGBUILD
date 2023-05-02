# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: vivaeltopo

_pkgname=upscayl
pkgname=$_pkgname-bin
pkgver=2.5.0
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
sha512sums=('849082a27d46c846217732777b837890e9745872962207b86ab0db50dc3db56f316232ea18f28bcf9f875c3027d9bdc0cab1f3f9ec80f47fdd275f663148beb5')

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
