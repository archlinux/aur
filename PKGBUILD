# Maintainer: lekker <bradyhickey at outlook.com>

pkgname=idevice-pair
pkgver=0.1.9
pkgrel=1
pkgdesc="A cross-platform GUI application for managing iOS device pairing and wireless debugging"
arch=('x86_64' 'aarch64')
url="https://github.com/jkcoxson/idevice_pair"
license=('MIT')
depends=('usbmuxd')
source_x86_64=("$pkgname-$pkgver-x86_64.AppImage::https://github.com/jkcoxson/idevice_pair/releases/download/v$pkgver/idevice_pair--linux-x86_64.AppImage"
               "idevice-pair.desktop")

source_aarch64=("$pkgname-$pkgver-aarch64.AppImage::https://github.com/jkcoxson/idevice_pair/releases/download/v$pkgver/idevice_pair--linux-aarch64.AppImage"
               "idevice-pair.desktop")
sha256sums_x86_64=('ebed3f63773f8eeaa05793c7b28873991a973c75bf309e79d1fcb74402678c0e'
                   'af1a6496109bd9c98b708c2fd388bcc38d1d004749160cb8ae0b85934f5507e5')
sha256sums_aarch64=('75eaecbbd9459378d010e3db20589d1d7c948da7fa41d3fa9ce1c5f2f8330d8b'
                   'af1a6496109bd9c98b708c2fd388bcc38d1d004749160cb8ae0b85934f5507e5')

prepare() {
  # Extract AppImage
  if [ "$CARCH" = "x86_64" ]; then
    chmod +x "$pkgname-$pkgver-x86_64.AppImage"
    "./$pkgname-$pkgver-x86_64.AppImage" --appimage-extract
  else
    chmod +x "$pkgname-$pkgver-aarch64.AppImage"
    "./$pkgname-$pkgver-aarch64.AppImage" --appimage-extract
  fi
}

package() {
  # Install binary from extracted AppImage
  install -Dm755 "$srcdir/squashfs-root/usr/bin/idevice_pair" "$pkgdir/usr/bin/idevice_pair"

  # Install icon from extracted AppImage
  install -Dm644 "$srcdir/squashfs-root/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/idevice-pair.png"

  # Install desktop file
  install -Dm644 "$srcdir/idevice-pair.desktop" "$pkgdir/usr/share/applications/idevice-pair.desktop"

}
