# Maintainer: Mahfuz Shaikh <mah3uz at gmail dot com>

pkgname=insensical-bin
_pkgname=insensical
_repo=mah3uz/insensical-release
pkgver=0.1.0
pkgrel=1
pkgdesc='A terminal multiplexer with a window of its own, for supervising many terminals and coding agents (prebuilt)'
arch=('x86_64')
url='https://insensical.com'
license=('MIT')
depends=('fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader')
optdepends=('ttf-jetbrains-mono-nerd: the default font; any Nerd Font serves'
            'ghostty-terminfo: programs in panes are given every feature of the terminal')
provides=('insensical')
conflicts=('insensical')
options=('!strip' '!debug')
source=("https://github.com/$_repo/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('ec2ea09bc94794bd4999a42b7f981426922d126bb64cc3903cd2b8cae6b6e8b0')

package() {
  cd "$_pkgname-$pkgver-x86_64-unknown-linux-gnu"
  install -Dm755 insensical isc -t "$pkgdir/usr/bin"
  install -Dm644 insensical.desktop -t "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons"
  cp -r --no-preserve=ownership icons/hicolor "$pkgdir/usr/share/icons/"
  # For what looks for an icon by its file and knows no themes.
  install -Dm644 icons/hicolor/256x256/apps/insensical.png -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 insensical.service -t "$pkgdir/usr/lib/systemd/user"
  install -Dm644 completions/isc.bash "$pkgdir/usr/share/bash-completion/completions/isc"
  install -Dm644 completions/isc.zsh "$pkgdir/usr/share/zsh/site-functions/_isc"
  install -Dm644 completions/isc.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm644 MANUAL.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE THIRD-PARTY-LICENSES.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
