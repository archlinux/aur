# Maintainer: Nguyen Hong Hiep <syaorancode@gmail.com>

pkgname=jotty-bin
_pkgname=jotty
pkgver=2.1.0
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
sha256sums_x86_64=('8e63bcc4b6de1b8c4b45bec57e0db0ce3d2454eb94bc14f2d47374b19001e598')
sha256sums_aarch64=('480138c50e6ab9ea8f8041150b80f19a590b4fbd388a45ba058f043ec2742ec8')
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
