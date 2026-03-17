# Maintainer: Clément Vicart <clem.vicart@gmail.com>

pkgname=balena-etcher-bin
pkgver=2.1.4
pkgrel=1
pkgdesc="Flash OS images to SD cards & USB drives, safely and easily"
arch=('x86_64')
url="https://etcher.balena.io/"
license=('Apache-2.0')
depends=(
  "gtk3"
  "alsa-lib"
  "nspr"
  "nss"
)
options=()
source=(
  "balenaEtcher-linux-x64-$pkgver.zip::https://github.com/balena-io/etcher/releases/download/v2.1.4/balenaEtcher-linux-x64-$pkgver.zip"
  "balenaEtcher.desktop"
  "balena-etcher.png::https://raw.githubusercontent.com/balena-io/etcher/refs/heads/master/assets/icon.png"
)
sha256sums=(
  'b0e08f001cc15cb0d648832db1d23273aa6ff25111bc104b8bc1f794aa9616d9'
  '6b1808769261cb40e92b8c1de6433de9e0cd17004670fd39a44b8a76de188421'
  '21762dedff586bffa6fb48fdeedd32dc8e7aa5fb3b4424e2865033857a52a547'
)

prepare() {
  rm balenaEtcher-linux-x64/balenaEtcher
}

package() {
  install -d -m 755 "$pkgdir/opt/$pkgname"
  cp -r balenaEtcher-linux-x64/* $pkgdir/opt/$pkgname

  # Symlink to make executable accessible system-wide
  install -d -m 755 "$pkgdir/usr/bin"
  ln -sf "/opt/$pkgname/balena-etcher" "$pkgdir/usr/bin/balena-etcher"

  # Install .desktop entry
  install -D -m 644 "$srcdir/balenaEtcher.desktop" "$pkgdir/usr/share/applications/balenaEtcher.desktop"

  install -D -m 644 "$srcdir/balena-etcher.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/balena-etcher.png"
}

