# Maintainer: strayblackcat

_pkgname="fchat-horizon"
pkgname="fchat-horizon-bin"
pkgver=1.32.3
pkgrel=1
pkgdesc="A continuation of the heavily modified F-Chat Rising client. Uses system electron."
url="https://github.com/Fchat-Horizon/Horizon"
license=('MIT')
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
  "https://raw.githubusercontent.com/Fchat-Horizon/Horizon/f947ca475fbb2edc2f724c39f90448963c1b06bc/electron/build/icon.png"
  "https://raw.githubusercontent.com/Fchat-Horizon/Horizon/refs/heads/main/LICENSE"
)
sha256sums=('4de6e96c56572f934d85387c9a4039e56812b579ea7b6a9a9070d00511207fb3'
            '6853b8e9d7ce674b063fe277c98fc9dcec4be4949731e6134a5f134d48892be5'
            '0f72b54ea25738958366465dd4ddc359a9d4105897f8a8b35bfe64b1a406b44f'
            '79c24919dcaa51f2907af9beb3fdf3ec0703e662ae2434d8e7fe28e15ae29b02'
            'b13bdf6682ae4d90990ebbd3b1472b91001b20c49c87d4366cc3cadb4dc084b4')

package() {
  cd "$srcdir"
  
  # Move misc resources to their correct place
  install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 "$_pkgname".desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE

  # We're using system electron, so pull out just what we actually need.
  cd 'F-Chat.Horizon-linux-x64/resources/'
  install -dm0755 "$pkgdir"/usr/share/$_pkgname
  find . -type d -exec install -d {,"$pkgdir"/usr/share/$_pkgname/}{} \;
  find . -type f -exec install -D {,"$pkgdir"/usr/share/$_pkgname/}{} \;
}
