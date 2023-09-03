# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: vivaeltopo

_pkgname=upscayl
pkgname=$_pkgname-bin
pkgver=2.7.5
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
sha512sums=('9b2b9f415cffb0963bfbb48e3fc6645c0994995d1b6acb3f8d326ddb04f0f3249414e657211f947238ace9b74514c9d68fe0d6a5fe620d3421c62540bd5a8006')

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
