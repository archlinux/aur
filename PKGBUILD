# Maintainer: strayblackcat

_pkgname="fchat-horizon"
pkgname="fchat-horizon-bin"
pkgver=2.5.3
pkgrel=1
pkgdesc="Horizon is a modern, community-driven fork of the F-Chat 3.0 client with expanded customization."
url="https://github.com/Fchat-Horizon/Horizon"
license=('MPL-2.0')
arch=('x86_64')

depends=(
  'electron43'
  'libnotify'
  'libsecret'
  'libappindicator-gtk3'
)
provides=('fchat')
conflicts=('fchat')

source=(
  "fchat-horizon-v$pkgver.tar.gz::https://github.com/Fchat-Horizon/Horizon/releases/download/v$pkgver/F-Chat.Horizon-$pkgver-linux-x64.tar.gz"
  "$_pkgname.sh"
  "$_pkgname.desktop"
  "$_pkgname-v$pkgver.png::https://raw.githubusercontent.com/Fchat-Horizon/Horizon/refs/heads/main/electron/build/icon.png"
  "$_pkgname-v$pkgver-LICENSE::https://raw.githubusercontent.com/Fchat-Horizon/Horizon/refs/heads/main/LICENSE.md"
)
sha256sums=('f67c6f4a38a345a8b6df261af3922387a08d3ef632a6b634a8b3b04a99bb54ed'
            '9bc353d08a505cceada49538defe13c69388085e8049ce747e19552419d860c1'
            'a1d0de75cc59576b1ae47eb592b10abe181f2cc6f605f4b1fffa03c818587d72'
            '2a98ef16ddd4579bb5d7232acc409ae942b244cd32011c344af56821417ea594'
            'a73c8a62214b4adc0fa41abe88eb5c36639d4adea7a73130ab54103b7620a4d1')

package() {
  cd "$srcdir"
  
  # Move misc resources to their correct place
  install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 "$_pkgname".desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 "$_pkgname-v$pkgver.png" "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  install -Dm644 "$_pkgname-v$pkgver-LICENSE" "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE

  # We're using system electron, so pull out just what we actually need.
  cd "F-Chat.Horizon-$pkgver-linux-x64/resources/"
  install -dm0755 "$pkgdir"/usr/share/$_pkgname
  find . -type d -exec install -d {,"$pkgdir"/usr/share/$_pkgname/}{} \;
  find . -type f -exec install -D {,"$pkgdir"/usr/share/$_pkgname/}{} \;
}
