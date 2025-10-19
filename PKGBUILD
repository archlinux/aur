# Maintainer: strayblackcat

_pkgname="fchat-horizon"
pkgname="fchat-horizon-bin"
pkgver=1.34.2
pkgrel=1
pkgdesc="A continuation of the heavily modified F-Chat Rising client. Uses system electron."
url="https://github.com/Fchat-Horizon/Horizon"
license=('GPL-3.0')
arch=('x86_64')

depends=(
  'electron'
  'libnotify'
  'libsecret'
  'libappindicator-gtk3'
)
provides=('fchat')
conflicts=('fchat')

source=(
  "fchat-horizon-v$pkgver.tar.gz::https://github.com/Fchat-Horizon/Horizon/releases/download/v$pkgver/F-Chat.Horizon-linux-x64.tar.gz"
  "$_pkgname.sh"
  "$_pkgname.desktop"
  "$_pkgname-v$pkgver.png::https://raw.githubusercontent.com/Fchat-Horizon/Horizon/refs/heads/main/electron/build/icon.png"
  "$_pkgname-v$pkgver-LICENSE::https://raw.githubusercontent.com/Fchat-Horizon/Horizon/refs/heads/main/LICENSE"
)
sha256sums=('9cb784037f1939bb8c59e3a0ab6af97b2d0357878a172ce1e9c973c0577a011d'
            '6853b8e9d7ce674b063fe277c98fc9dcec4be4949731e6134a5f134d48892be5'
            '1402f1449db1349c38ebdf3b1d4d8091beeefdb6bc185a02de75befae4d4f5d0'
            '79c24919dcaa51f2907af9beb3fdf3ec0703e662ae2434d8e7fe28e15ae29b02'
            'd4a32ce6914b6ab0bd2112076688870a66da29cb83576223bf6d3a911512929f')

package() {
  cd "$srcdir"
  
  # Move misc resources to their correct place
  install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 "$_pkgname".desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 "$_pkgname-v$pkgver.png" "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  install -Dm644 "$_pkgname-v$pkgver-LICENSE" "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE

  # We're using system electron, so pull out just what we actually need.
  cd 'F-Chat.Horizon-linux-x64/resources/'
  install -dm0755 "$pkgdir"/usr/share/$_pkgname
  find . -type d -exec install -d {,"$pkgdir"/usr/share/$_pkgname/}{} \;
  find . -type f -exec install -D {,"$pkgdir"/usr/share/$_pkgname/}{} \;
}
