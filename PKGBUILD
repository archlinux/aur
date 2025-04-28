# Maintainer: strayblackcat

_pkgname="fchat-horizon"
pkgname="fchat-horizon-bin"
pkgver=1.30.3
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
  'https://raw.githubusercontent.com/Fchat-Horizon/Horizon/refs/heads/main/electron/build/icon.png'
  'https://raw.githubusercontent.com/Fchat-Horizon/Horizon/refs/heads/main/LICENSE'
)
sha256sums=('aa51a963de9518410f85e5995919a382a5f7072265cc5c7796dfd42af2de04b1'
            '6853b8e9d7ce674b063fe277c98fc9dcec4be4949731e6134a5f134d48892be5'
            '0f72b54ea25738958366465dd4ddc359a9d4105897f8a8b35bfe64b1a406b44f'
            'dec49091c629a2e5956e14b32a823f2a63cd1549f4b1d650d3ad32948d95e822'
            'b13bdf6682ae4d90990ebbd3b1472b91001b20c49c87d4366cc3cadb4dc084b4')

package() {
  cd "$srcdir"
  
  # Move misc resources to their correct place
  install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 "$_pkgname".desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE

  # We're using system electron, so pull out just what we actually need.
  cd 'F-Chat Horizon-linux-x64/resources/'
  install -dm0755 "$pkgdir"/usr/share/$_pkgname
  find . -type d -exec install -d {,"$pkgdir"/usr/share/$_pkgname/}{} \;
  find . -type f -exec install -D {,"$pkgdir"/usr/share/$_pkgname/}{} \;
}
