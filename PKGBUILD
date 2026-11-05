# Maintainer: ExtremTechniker <aur@extremtechniker.io>
pkgname=forge-ide-bin
# Forge's version as released; pacman's pkgver cannot contain "-", so a pre-release drops it
# (0.1.1-beta.1 -> 0.1.1beta.1, which pacman sorts before the final 0.1.1).
_ver=0.1.1-beta.1
pkgver=${_ver//-/}
pkgrel=1
pkgdesc="PHPStorm-style IDE for PHP, web and Lua (prebuilt release)"
arch=('x86_64')
url="https://github.com/Reeperk/Forge"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'openssl' 'hicolor-icon-theme')
provides=("forge-ide=$pkgver")
conflicts=('forge-ide' 'forge' 'foundry')
options=('!strip' '!debug')
# The release carries the .deb that Tauri builds; makepkg unpacks it into $srcdir.
source_x86_64=("Forge_${_ver}_amd64.deb::https://github.com/stdimnet/forge-ide-bin/releases/download/v0.1.1-beta.1/Forge_0.1.1-beta.1_amd64.deb")
# Fill in with `updpkgsums` once the release exists.
sha256sums_x86_64=('aa3e180c0c74b078a60a082e42d5d93f8d4ef4a3d37c15787ac07c2cb9abd24c')

package() {
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
  chmod -R go-w "$pkgdir"
}
