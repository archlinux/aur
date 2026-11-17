# Maintainer: ExtremTechniker <aur@extremtechniker.io>
pkgname=forge-ide-bin
# Forge's version as released; pacman's pkgver cannot contain "-", so a pre-release drops it
# (0.1.1-beta.1 -> 0.1.1beta.1, which pacman sorts before the final 0.1.1).
_ver=0.1.1-beta.4
pkgver=${_ver//-/}
pkgrel=1
pkgdesc="PHPStorm-style IDE for PHP, web and Lua (prebuilt release)"
arch=('x86_64')
url="https://github.com/stdimnet/forge"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'openssl' 'hicolor-icon-theme')
provides=("forge-ide=$pkgver")
conflicts=('forge-ide' 'forge' 'foundry')
options=('!strip' '!debug')
# The release carries the .deb that Tauri builds; makepkg unpacks it into $srcdir.
source_x86_64=("Forge_${_ver}_amd64.deb::https://github.com/stdimnet/forge/releases/download/v${_ver}/Forge_${_ver}_amd64.deb")
# Set by the AUR workflow (.github/workflows/aur.yml) for every release.
sha256sums_x86_64=('601567de53e69fad1eee055586675f9d842ece8a13d479985de72c40c5ef73ad')

package() {
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
  chmod -R go-w "$pkgdir"
}
