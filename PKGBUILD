pkgname=mirage-realms
pkgver=1.0.0
pkgrel=1
pkgdesc="Free to play indie MMORPG for Android and PC"
arch=("x86_64")
url="https://www.miragerealms.co.uk"
license=("custom")
depends=("java-runtime>=11")
makedepends=("unzip")
source=(
  "https://www.miragerealms.co.uk/files/clients/legacy/Mirage-LinuxX64.zip"
  "mirage-realms.desktop"
  "https://www.miragerealms.co.uk/wp-content/uploads/2017/01/favicon.png"
)
sha256sums=("SKIP" "SKIP" "SKIP")

package() {
  install -dm755 "$pkgdir/opt/$pkgname"
  unzip Mirage-LinuxX64.zip -d "$srcdir/_mr"

  gamefolder="$(find "$srcdir/_mr" -mindepth 1 -maxdepth 1 -type d | head -n 1)"
  cp -r "$gamefolder"/* "$pkgdir/opt/$pkgname/"

  chmod +x "$pkgdir/opt/$pkgname/Mirage Realms"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/Mirage Realms" "$pkgdir/usr/bin/mirage-realms"

  install -Dm644 "$srcdir/mirage-realms.desktop" \
    "$pkgdir/usr/share/applications/mirage-realms.desktop"

  install -Dm644 "$srcdir/favicon.png" \
    "$pkgdir/usr/share/pixmaps/mirage-realms.png"
}
