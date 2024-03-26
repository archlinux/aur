# Maintainer: Douglas <hashy.software@gmail.com>
_appimage=hasherino
_desktopentry="[Desktop Entry]
Type=Application
Version=1.0
Name=hasherino
Comment=A twitch chat client
Exec=$_appimage
Terminal=false
Categories=Python;Chat;Twitch;Network;InstantMessaging;"
pkgname=hasherino-latest-bin
pkgver=0.1.15
pkgrel=1
epoch=
pkgdesc="A twitch chat client"
arch=('x86_64')
url="https://github.com/Hashy-Software/hasherino"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("hasherino")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "$pkgname::git+https://github.com/Hashy-Software/hasherino.git"
  "https://github.com/Hashy-Software/hasherino/releases/download/v$pkgver/$_appimage"
)
noextract=()
sha256sums=(
  SKIP
  SKIP
)

prepare() {
  cd "$srcdir"
  chmod +x "$_appimage"
}
pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --abbrev=0 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
  cd "$srcdir"
  install -Dm755 $_appimage "$pkgdir/opt/hasherino/$_appimage"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/hasherino/$_appimage" "$pkgdir/usr/bin/hasherino"
  install -Dm644 /dev/null "$pkgdir/usr/share/applications/com.hasherino.hasherino.desktop"
  echo -e "$_desktopentry" > "$pkgdir/usr/share/applications/com.hasherino.hasherino.desktop"
}
