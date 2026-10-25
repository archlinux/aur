# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>
# Contributor: Liberty Raptor <libertyraptor at protonmail dot com>

pkgname=xemu-bin
pkgver=0.8.139
pkgrel=2
pkgdesc="Emulator for the original Xbox console"
arch=(x86_64)
url="https://xemu.app"
license=('GPL-2.0-only')
provides=(xemu)
conflicts=(xemu xemu-git)
options=(!debug)
source=(xemu-$pkgver.AppImage::https://github.com/xemu-project/xemu/releases/download/v$pkgver/xemu-$pkgver-x86_64.AppImage)
sha256sums=('220282aacf09b30b35c55ba900a774fb6940c70deca1408bc70a4c9cc67c322f')

prepare() {
  chmod 755 xemu-$pkgver.AppImage
  ./xemu-$pkgver.AppImage --appimage-extract
  rm -f xemu-$pkgver.AppImage
}

package() {
  install -dm755 "$pkgdir"/{usr/bin,opt/xemu/{bin,lib}}
  install -Dm755 "$srcdir"/squashfs-root/usr/bin/xemu -t "$pkgdir"/opt/xemu/bin/
  install -Dm644 "$srcdir"/squashfs-root/usr/lib/*    -t "$pkgdir"/opt/xemu/lib/

  ln -sr "$pkgdir"/opt/xemu/bin/xemu -t "$pkgdir"/usr/bin/

  install -Dm644 "$srcdir"/squashfs-root/usr/share/applications/xemu.desktop            -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/squashfs-root/usr/share/icons/hicolor/scalable/apps/xemu.svg -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
}
