# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: vivaeltopo

_pkgname=upscayl
pkgname=$_pkgname-bin
pkgver=2.8.0
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
sha512sums=('c68ab53b5c1d709ee1e3690806141a5aa684221622e3eb3d94de194b59ca91bb623e7cab31825b78a5785e73abdf6732ef4495f1b70189eb34c4ff8805655445')

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
