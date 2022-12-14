# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: vivaeltopo

_pkgname=upscayl
pkgname=$_pkgname-bin
pkgver=1.5.5
pkgrel=2
pkgdesc='Free and Open Source AI Image Upscaler'
url='https://github.com/upscayl/upscayl'
license=('AGPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('fuse2' 'zlib')
makedepends=('util-linux')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
source=("https://github.com/upscayl/upscayl/releases/download/v${pkgver}/Upscayl-${pkgver}.AppImage")
sha512sums=('161c864fce65009234c5950358b4869fbb0899d931d03e394431a9fe5027c00281705713c6fb0e33cd30f6d37687538e53167f6c3d116ee1749cff7cff8b5147')

prepare() {
  [[ -d squashfs-root ]] && rm -rf squashfs-root
  chmod 755 Upscayl-${pkgver}.AppImage
  ./Upscayl-${pkgver}.AppImage --appimage-extract
  sed -i 's|^Exec=.*|Exec=upscayl|' squashfs-root/upscayl.desktop
}

package() {
  install -Dm644 squashfs-root/usr/share/icons/hicolor/0x0/apps/upscayl.png "$pkgdir/usr/share/pixmaps/upscayl.png"
  install -Dm644 squashfs-root/upscayl.desktop "$pkgdir/usr/share/applications/upscayl.desktop"
  install -Dm755 Upscayl-${pkgver}.AppImage "$pkgdir/usr/bin/$_pkgname"
}
