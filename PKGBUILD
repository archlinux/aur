# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go2train-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Go2Train - Online Language Learning"
arch=('x86_64')
url="https://go2train.co/"
license=('custom')
depends=(
  'glibc'
  'gtk3'
  'libnotify'
  'nss'
  'xdg-utils'
  'at-spi2-core'
  'libdrm'
  'mesa'
  'libxcb'
)
optdepends=(
  'kde-cli-tools: Trash support via KDE trash'
  'trash-cli: Trash support alternative'
  'gvfs: Another trash support alternative'
  'pulseaudio: Sound server'
  'alsa-lib: Sound support alternative'
  'gnome-keyring: For keyring integration'
  'lsb-release: For distro info'
)
provides=('go2train')
conflicts=('go2train')
source=("https://train-apks.file.g2storage.com/production/desktop/linux/linux_${pkgver}.deb")
sha256sums=('11ab4e935882975d9cf569e61d0427286aab2a6325956c1658d3a9f9f5e05a49')

package() {
  bsdtar -xf "${srcdir}/linux_${pkgver}.deb" -C "$srcdir"

  bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"

  find "$pkgdir" -type d -exec chmod 755 {} +

  find "$pkgdir/usr/bin" -type f -exec chmod 755 {} + 2>/dev/null || true
  find "$pkgdir/usr/lib" -type f -name "*.so*" -exec chmod 644 {} + 2>/dev/null || true
}
