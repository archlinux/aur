# Maintainer: Jason Landbridge <JasonLandbridge at aur dot archlinux dot org>

pkgname=mcp-linker-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Desktop manager for adding and syncing MCP servers across AI clients"
arch=('x86_64')
url="https://github.com/milisp/mcp-linker"
license=('AGPL-3.0-or-later')
depends=('fuse2' 'webkit2gtk-4.1' 'gtk3')
optdepends=('xdg-utils: open external URLs from the desktop environment')
provides=('mcp-linker')
conflicts=('mcp-linker')
options=('!strip')
_tag="v${pkgver}"
_upstream_name="MCPLinker"
noextract=("${_upstream_name}_${pkgver}_amd64.AppImage")
source=(
  "${_upstream_name}_${pkgver}_amd64.AppImage::https://github.com/milisp/mcp-linker/releases/download/${_tag}/${_upstream_name}_${pkgver}_amd64.AppImage"
  "mcp-linker-bin.png::https://raw.githubusercontent.com/milisp/mcp-linker/${_tag}/src-tauri/icons/128x128.png"
  "mcp-linker-bin.desktop"
  "mcp-linker-bin.sh"
  "LICENSE"
)
sha256sums=(
  '656d6e55c86a7add1b377b624a87871d2f32b7c2e82428f2301a28a3bfa03aa4'
  '17b717623d714585d43fe064157261bc48f93f48aea176eabdee2cf8905b8ab5'
  'c474269f10d838b1e8b044f124dd9b32199fddef24df811d7a05db331536f834'
  '897687752a9600edcdfc1105565029a1d2f29dada259b970c1f7b4c66d84708c'
  'd505308ce53c54f0e5dc890b85e19182d5c6d60a594de316c24e7a8d29665342'
)

package() {
  install -Dm755 "$srcdir/${_upstream_name}_${pkgver}_amd64.AppImage" \
    "$pkgdir/opt/$pkgname/MCPLinker.AppImage"

  install -Dm755 "$srcdir/mcp-linker-bin.sh" \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/mcp-linker-bin.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 "$srcdir/mcp-linker-bin.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$srcdir/mcp-linker-bin.desktop" \
    "$pkgdir/opt/$pkgname/$pkgname.desktop"

  printf '%s\n' \
    'This package repackages the upstream MCP Linker AppImage.' \
    'Upstream project: https://github.com/milisp/mcp-linker' \
    > "$pkgdir/opt/$pkgname/README.Arch"
}
