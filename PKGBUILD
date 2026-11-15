# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=neje-bin
_pkgname=neje
pkgver=0.1.0
pkgrel=1
pkgdesc="Free software for the NEJE DK-8-KZ laser engraver: pictures, text and G-code, print modes, CLI and GUI (prebuilt)"
arch=('x86_64')
url="https://github.com/deddroid/neje-rs"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libglvnd' 'libxkbcommon' 'hicolor-icon-theme')
optdepends=('wayland: native Wayland window'
            'libx11: X11 window'
            'xdg-desktop-portal: file dialogs of the window')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto' '!strip' '!debug')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
sha256sums=('3d62c51cf4a3731576dc94466d3cfa49a79e10240ee32fee6c023c022a77464a')

package() {
  cd "$_pkgname-$pkgver-linux-x86_64"
  install -Dm755 neje neje-gui -t "$pkgdir/usr/bin/"
  install -Dm644 packaging/linux/neje.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 packaging/linux/70-neje.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icon-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/neje.png"
  done
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md README.it.md CHANGELOG.md docs/PROTOCOL.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
