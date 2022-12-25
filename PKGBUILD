# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: vivaeltopo

_pkgname=upscayl
pkgname=$_pkgname-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='Free and Open Source AI Image Upscaler'
url='https://github.com/upscayl/upscayl'
license=('AGPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('fuse2' 'zlib')
makedepends=('util-linux')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
source=("https://github.com/upscayl/upscayl/releases/download/v${pkgver}/upscayl-${pkgver}-linux.AppImage")
sha512sums=('f6b6940336afd969c2b9b83150c5166dff4611f8c6b0260fe1cd46095bfb2c594229d606a2ea43206ec9b5590a1ffda6708717c35171b67784ab63ff6966fcd7')

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
