# Maintainer: OldJobobo
pkgbase=splinterm-bin
pkgname=('splinterm-bin' 'splinterm-mcp-bin')
pkgver=0.1.0alpha3.3
pkgrel=1
_commit=0c4276703eaa01b347fdbeb6327669b2b109e8b6
arch=('x86_64')
url='https://github.com/oldjobobo/splinterm'
license=('MIT')
options=('!strip' '!debug')
source=(
  "splinterm-$pkgver-$CARCH.pkg.tar.zst::https://github.com/OldJobobo/splinterm/releases/download/v0.1.0-alpha3.3/splinterm-$_commit-$CARCH.pkg.tar.zst"
  "splinterm-mcp-$pkgver-$CARCH.pkg.tar.zst::https://github.com/OldJobobo/splinterm/releases/download/v0.1.0-alpha3.3/splinterm-mcp-$_commit-$CARCH.pkg.tar.zst"
)
noextract=(
  "splinterm-$pkgver-$CARCH.pkg.tar.zst"
  "splinterm-mcp-$pkgver-$CARCH.pkg.tar.zst"
)
sha256sums=(
  '5104941b47776b1a06aea044c50a4179afcc9fa6c843a663d47ac728d99bc456'
  'a5b8e5ac5c583df75275881e2527940d3a999c20cb33e2521a366840d2abc4c2'
)

_extract_payload() {
  bsdtar -xpf "$1" -C "$pkgdir" \
    --exclude .BUILDINFO \
    --exclude .INSTALL \
    --exclude .MTREE \
    --exclude .PKGINFO
}

package_splinterm-bin() {
  pkgdesc='Persistent Wayland terminal for humans and bounded automation (prebuilt binary)'
  depends=(
    'fontconfig'
    'freetype2'
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'libxkbcommon'
    'noto-fonts-cjk'
    'noto-fonts-emoji'
    'pixman'
    'python'
    'ttf-jetbrains-mono-nerd'
    'wayland'
    'xdg-terminal-exec'
  )
  optdepends=(
    'fcitx5: Wayland text-input support'
    'splinterm-mcp: explicitly configured MCP stdio adapter'
  )
  provides=("splinterm=$pkgver-$pkgrel")
  conflicts=('splinterm')
  install=splinterm.install

  _extract_payload "$srcdir/splinterm-$pkgver-$CARCH.pkg.tar.zst"
  mv "$pkgdir/usr/share/licenses/splinterm" \
    "$pkgdir/usr/share/licenses/splinterm-bin"
}

package_splinterm-mcp-bin() {
  pkgdesc='Policy-scoped MCP stdio adapter for Splinterm (prebuilt binary)'
  depends=("splinterm=$pkgver-$pkgrel" 'gcc-libs' 'glibc')
  provides=("splinterm-mcp=$pkgver-$pkgrel")
  conflicts=('splinterm-mcp')

  _extract_payload "$srcdir/splinterm-mcp-$pkgver-$CARCH.pkg.tar.zst"
  mv "$pkgdir/usr/share/licenses/splinterm-mcp" \
    "$pkgdir/usr/share/licenses/splinterm-mcp-bin"
}
