# Maintainer: OldJobobo
pkgbase=splinterm-bin
pkgname=('splinterm-bin' 'splinterm-mcp-bin')
pkgver=0.1.0rc.2
pkgrel=1
_commit=b7f735e2257a6ae4f595e0f111f90c28279f5711
arch=('x86_64')
url='https://github.com/oldjobobo/splinterm'
license=('MIT')
options=('!strip' '!debug')
source=(
  "splinterm-$pkgver-$CARCH.pkg.tar.zst::https://github.com/OldJobobo/splinterm/releases/download/v0.1.0-rc.2/splinterm-$_commit-$CARCH.pkg.tar.zst"
  "splinterm-mcp-$pkgver-$CARCH.pkg.tar.zst::https://github.com/OldJobobo/splinterm/releases/download/v0.1.0-rc.2/splinterm-mcp-$_commit-$CARCH.pkg.tar.zst"
)
noextract=(
  "splinterm-$pkgver-$CARCH.pkg.tar.zst"
  "splinterm-mcp-$pkgver-$CARCH.pkg.tar.zst"
)
sha256sums=(
  'fcf23d3fe428a59e4228a8ea62584bbc1ad0eb553f74a51f385310117a4274bf'
  'e7aba1d7112c711c8acbdbf1a44b85703c288608022a62aea0bbddafea8a27e7'
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
    'splinterm-mcp-bin: explicitly configured MCP stdio adapter'
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
