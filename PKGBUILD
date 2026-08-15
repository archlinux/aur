# Maintainer: Magnus Anderssen <magnus at magooweb dot com>
pkgname=chemcanvas-bin
pkgver=0.14.8
pkgrel=1
pkgdesc="User-friendly 2D chemical structure drawing tool (precompiled AppImage release)"
arch=('x86_64' 'aarch64')
url="https://github.com/ksharindam/chemcanvas"
license=('GPL-3.0-or-later')
options=('!strip')
provides=('chemcanvas')
conflicts=('chemcanvas')
optdepends=('fuse2: run the AppImage without the extract-and-run fallback')
source_x86_64=("$pkgname-$pkgver.AppImage::https://github.com/ksharindam/chemcanvas/releases/download/v$pkgver/ChemCanvas-x86_64.AppImage")
source_aarch64=("$pkgname-$pkgver.AppImage::https://github.com/ksharindam/chemcanvas/releases/download/v$pkgver/ChemCanvas-aarch64.AppImage")
sha256sums_x86_64=('c8a048f5bd5a5a72bb378f00cb0cfb484685089a3d6f7e1498e24ab3484d37a6')
sha256sums_aarch64=('a6b475fc89c7b1a8cdbe0a88ddb5ed0558ce1a83f8839fc191a03a1066c9c9a3')

package() {
  cd "$srcdir"
  chmod +x "$pkgname-$pkgver.AppImage"

  # Pull the bundled .desktop file and icon out of the AppImage so the
  # app shows up properly in application menus.
  ./"$pkgname-$pkgver.AppImage" --appimage-extract >/dev/null

  install -Dm755 "$pkgname-$pkgver.AppImage" "$pkgdir/usr/bin/chemcanvas"
  install -Dm644 squashfs-root/io.github.ksharindam.chemcanvas.desktop \
    "$pkgdir/usr/share/applications/io.github.ksharindam.chemcanvas.desktop"
  install -Dm644 squashfs-root/usr/share/icons/hicolor/scalable/apps/chemcanvas.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/chemcanvas.svg"
}
