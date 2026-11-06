# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=odyssey-ctl-bin
_pkgname=odyssey-ctl
pkgver=0.2.0
pkgrel=1
pkgdesc="Control Samsung Odyssey monitors over DDC/CI: picture, game and lighting settings, presets, CLI and GUI (prebuilt)"
arch=('x86_64')
url="https://github.com/deddroid/odyssey-ctl"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libglvnd' 'libxkbcommon')
optdepends=('wayland: native Wayland window'
            'libx11: X11 window')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto' '!strip' '!debug')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
sha256sums=('04c68472682a82e1cd29bd25477e796d2c67854bedf6c3000f26bdb7fbf21d5b')

package() {
  cd "$_pkgname-$pkgver-linux-x86_64"
  install -Dm755 odyssey-ctl odyssey-ctl-gui -t "$pkgdir/usr/bin/"
  install -Dm644 odyssey-ctl.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 70-odyssey-ctl.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 odyssey-ctl.conf -t "$pkgdir/usr/lib/modules-load.d/"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "icons/icon-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/odyssey-ctl.png"
  done
  install -Dm644 icons/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/odyssey-ctl.svg"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md README.it.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
