# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>
# This is the Unofficial package of Go2Train
# Go2Train all rights reserved ©

pkgname=go2train-bin
pkgver=1.0.3
pkgrel=2
pkgdesc="Online language learning app (unofficial package)"
arch=('x86_64')
url="https://go2train.co/"
# The app itself is proprietary; the bundled Electron runtime is MIT.
license=('LicenseRef-go2train' 'MIT')
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
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
# Direct, versioned vendor URL. The g2ns.ir short link used before resolved to
# the same file but could start serving a newer .deb silently.
source=("go2train_${pkgver}.deb::https://train-apks.file.g2storage.com/production/desktop/linux/linux_${pkgver}.deb")
sha256sums=('11ab4e935882975d9cf569e61d0427286aab2a6325956c1658d3a9f9f5e05a49')

package() {
  bsdtar -xf "${srcdir}/go2train_${pkgver}.deb" -C "$srcdir"
  bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"

  find "$pkgdir" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/bin" -type f -exec chmod 755 {} + 2>/dev/null || true
  find "$pkgdir/usr/lib" -type f -name "*.so*" -exec chmod 644 {} + 2>/dev/null || true

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/doc/go2train/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron"
}
