# Maintainer: Nguyen Hong Hiep <syaorancode@gmail.com>

pkgname=jotty-bin
_pkgname=jotty
pkgver=2.2.0
pkgrel=1
pkgdesc='An opinionated, Wayland-native terminal emulator that supports both CPU and GPU renderer'
arch=('x86_64' 'aarch64')
url='https://github.com/justanoobcoder/jotty'
license=('MIT')
depends=('gcc-libs' 'glibc' 'wayland' 'libxkbcommon' 'libglvnd' 'fontconfig' 'hicolor-icon-theme')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('7cb7f2f5082106fb2a3d5dfd2c2b2852ea72fb1aecf5afa51d2254759ff0434c')
sha256sums_aarch64=('2ff5942a12384a987f419f44d8cb41fb36b6a2091f618e07820556959cbefbe2')
options=('!debug' '!strip')

package() {
  cd "$_pkgname-$pkgver-$CARCH-linux"
  install -Dm755 bin/jotty -t "$pkgdir/usr/bin"
  install -Dm644 share/terminfo/j/jotty -t "$pkgdir/usr/share/terminfo/j"
  install -Dm644 share/applications/jotty.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 share/icons/hicolor/scalable/apps/jotty.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  cd "share/doc/$_pkgname"
  install -Dm644 LICENSE THIRD-PARTY-LICENSES -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 ./*.md config.example.toml -t "$pkgdir/usr/share/doc/$_pkgname"
}
