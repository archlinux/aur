# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>
# This is the Unofficial package of Go2Train
# Go2Train all rights reserved ©

pkgname=go2train-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Go2Train - Online Language Learning App (Unofficial)"
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
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=(
  "go2train_${pkgver}.deb::https://train-apks.file.g2storage.com/production/desktop/linux/linux_${pkgver}.deb"
)
sha256sums=(
  "11ab4e935882975d9cf569e61d0427286aab2a6325956c1658d3a9f9f5e05a49"
)

DLAGENTS=('https::/usr/bin/wget --referer=https://go2train.co/ --user-agent=Mozilla/5.0\ (X11;\ Linux\ x86_64)\ AppleWebKit/537.36\ \(KHTML,\ like\ Gecko\)\ Chrome/114.0.0.0\ Safari/537.36 -O %o %u')

package() {
  bsdtar -xf "${srcdir}/go2train_${pkgver}.deb" -C "$srcdir"
  bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"

  find "$pkgdir" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/bin" -type f -exec chmod 755 {} + 2>/dev/null || true
  find "$pkgdir/usr/lib" -type f -name "*.so*" -exec chmod 644 {} + 2>/dev/null || true
}
