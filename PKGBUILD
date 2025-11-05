# Maintainer: strayblackcat

_pkgname="fchat-horizon"
pkgname="fchat-horizon-bin"
pkgver=1.35.0
pkgrel=1
pkgdesc="Horizon is a modern, community-driven fork of the F-Chat 3.0 client with expanded customization."
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
sha256sums=('6cb50d1239913bf81180be30f3dc2937b0188cc54f92de8d4e3154ef8df4eb4f'
            '6853b8e9d7ce674b063fe277c98fc9dcec4be4949731e6134a5f134d48892be5'
            'a1d0de75cc59576b1ae47eb592b10abe181f2cc6f605f4b1fffa03c818587d72'
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
