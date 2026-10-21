# Maintainer: Tássio Virgínio <tassiovirginio@gmail.com>
# Co-Maintainer: TraceDraw contributors <noreply@tracedraw.dev>

pkgname=tracedraw-bin
_pkgname=tracedraw
pkgver=0.10.0
pkgrel=1
pkgdesc="Vector illustration, page layout and print: an open-source vector editor (prebuilt binary)"
arch=('x86_64')
url="https://github.com/igtoth/tracedraw"
license=('MIT' 'Apache-2.0')
depends=(
  'fontconfig'
  'libx11'
  'libxcursor'
  'libxrandr'
  'libxi'
  'libxkbcommon'
  'mesa'
  'wayland'
)
optdepends=(
  'xdg-desktop-portal: native file dialogs'
  'hicolor-icon-theme: standard icon theme'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug')
source=("$_pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/igtoth/tracedraw/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
sha256sums=('92aa4ee1553cfe0ef97bc165451c915e238afb71b1953cf860b2d7a2f61c1f35')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm755 "$srcdir/tracedraw-cli" "$pkgdir/usr/bin/tracedraw-cli"

  install -Dm644 "$startdir/tracedraw.desktop" \
    "$pkgdir/usr/share/applications/tracedraw.desktop"

  for size in 16 32 64 128 256 512; do
    install -Dm644 "$startdir/tracedraw-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/tracedraw.png"
  done

  install -Dm644 "$startdir/LICENSE-MIT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
