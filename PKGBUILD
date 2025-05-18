# Maintainer: xyzrodd@proton.me
pkgname=oblivion
pkgver=2.91.3
pkgrel=1
pkgdesc="Oblivion Desktop - Unofficial Warp Client for Windows/Mac/Linux"
arch=('x86_64')
url="https://github.com/bepass-org/oblivion-desktop"
depends=("electron34")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v$pkgver/oblivion-desktop-linux-x64.tar.xz")
sha257sums=('SKIP')

source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/v$pkgver/oblivion-desktop-linux-x64.tar.xz"
  "${pkgname}.desktop")
sha256sums=(
  'SKIP'
  'SKIP'
)

package() {
  # Create the /opt directory for the app
  install -dm755 "$pkgdir/opt/$pkgname"

  # Install desktop entry
  install -Dm644 "$srcdir/oblivion.desktop" "$pkgdir/usr/share/applications/oblivion.desktop"

  # Copy everything from the extracted tar.xz into /opt
  cp -r "$srcdir/oblivion-desktop-linux-x64/"* "$pkgdir/opt/$pkgname/"

  # Create a symlink to the main binary in /usr/bin
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/oblivion-desktop" "$pkgdir/usr/bin/oblivion"
}
